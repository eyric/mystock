<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Assist extends CI_Controller {

    public function __construct(){
        parent::__construct();
		$this->common_model->checkpurview();
    }
	
	public function index(){
		$v = array();
	    $data['status'] = 200;
		$data['msg']    = 'success'; 
	    $type   = str_enhtml($this->input->get('typeNumber',TRUE));
		$skey   = str_enhtml($this->input->get('skey',TRUE));
		$where = '';
		if ($type) {
			$where .= ' and typenumber="'.$type.'"';
		}
		if ($skey) {
			$where .= ' and name like "%'.$skey.'%"';
		}
		$pid  = $this->mysql_model->get_results(MENU,'(isDelete=0) '.$where.' order by id','parentId');  
		$list = $this->mysql_model->get_results(MENU,'(isDelete=0) '.$where.' order by path');  
		foreach ($list as $arr=>$row) {
			$v[$arr]['detail']      = in_array($row['id'],$pid) ? false : true;
			$v[$arr]['id']          = intval($row['id']);
			$v[$arr]['level']       = $row['level'];
			$v[$arr]['name']        = $row['name'];
			$v[$arr]['parentId']    = intval($row['parentId']);
			$v[$arr]['remark']      = $row['remark'];
			$v[$arr]['sortIndex']   = intval($row['sortIndex']);
			$v[$arr]['status']      = intval($row['isDelete']);
			$v[$arr]['typeNumber']  = $row['typeNumber']; 
		}
		$data['data']['items']      = $v;
		$data['data']['totalsize']  = $this->mysql_model->get_count(MENU,'(isDelete=0) '.$where.'');
		die(json_encode($data));	  
	}
    
	//分类
	public function getAssistType(){
		$v = array();
	    $data['status'] = 200;
		$data['msg']    = 'success'; 
	    $v = array(
			0 => array('id'=>1001,'name'=>'商品类别','number'=>'trade'),
			1 => array('id'=>1002,'name'=>'客户类别','number'=>'customertype'),
			2 => array('id'=>1003,'name'=>'供应商类别','number'=>'supplytype'),
			3 => array('id'=>1004,'name'=>'收入类别','number'=>'raccttype'),
			4 => array('id'=>1005,'name'=>'支出类别','number'=>'paccttype')
		);
		$data['data']['items']      = $v;
		$data['data']['totalsize']  = 5;
		die(json_encode($data));		  
	}
	
	//新增
	public function add(){
		//$this->common_model->checkpurview(59);
		$data = str_enhtml($this->input->post(NULL,TRUE));
		if (count($data)>0) {
			$data['typeNumber'] = str_enhtml($this->input->get_post('typeNumber',TRUE));
			$data['parentId'] = isset($data['parentId']) ? $data['parentId'] : 0;
			strlen($data['name']) < 1 && str_alert(-1,'类别名称不能为空');
			if ($data['parentId']==0) {    
				$newid = $this->mysql_model->insert(MENU,$data);
				$this->mysql_model->update(MENU,array('path'=>$newid),'(id='.$newid.')');
			} else {   	
				$cate = $this->mysql_model->get_row(MENU,'(id='.$data['parentId'].')');   
				count($cate)<1 && str_alert(-1,'参数错误'); 
				$data['level'] = $cate['level'] + 1;                           
				$newid = $this->mysql_model->insert(MENU,$data);        
				$this->mysql_model->update(MENU,array('path'=>$cate['path'].','.$newid),'(id='.$newid.')');    
			}
			$data['id'] = $newid;
			$this->common_model->logs('新增类别:'.$data['name']);
			str_alert(200,'success',$data);
		}
		str_alert(-1,'添加失败');
	}
	
	//修改
	public function update(){
		$this->common_model->checkpurview(59);
		$data = str_enhtml($this->input->post(NULL,TRUE));
		if (count($data)>0) {
			$data['typeNumber'] = str_enhtml($this->input->get_post('typeNumber',TRUE));
			$pid  = isset($data['parentId']) ? $data['parentId'] : 0;
			$id   = intval($data['id']);
			$name = $data['name'];
		    strlen($name) < 1 && str_alert(-1,'类别名称不能为空');
		    $cate = $this->mysql_model->get_row(MENU,'(id='.$id.')');                                          //获取原ID数据
			count($cate)<1 && str_alert(-1,'参数错误'); 
			$old_pid  = $cate['parentId'];
			$old_path = $cate['path'];
			$pid_list = $this->mysql_model->get_results(MENU,'(id<>'.$id.') and find_in_set('.$id.',path)');    //是否有子栏目
		    $old_pid_num = count($pid_list);         //是否有子栏目
		    //$pid == $old_pid && alert('没有移动'); 
			$pid == $id && str_alert(-1,'当前分类和上级分类不能相同');
			if ($pid==0) {                     //多级转顶级 
			    $pare_depth = 1; 
			    if ($old_pid_num==0) {         //ID不存在子栏目
				    $this->mysql_model->update(MENU,array('parentId'=>0,'path'=>$id,'level'=>1,'name'=>$name),'(id='.$id.')');
				} else {                       //ID存在子栏目
				    $this->mysql_model->update(MENU,array('parentId'=>0,'path'=>$id,'level'=>1,'name'=>$name),'(id='.$id.')');
					foreach($pid_list as $arr=>$row) {
					    $path = str_replace($id,'',$old_path);
					    $path = str_replace(''.$path.'','',''.$row['path'].'');  
						$pare_depth = substr_count($path,',')+1;
						$datas[] =  array('id'=>$row['id'],'path'=>$path,'level'=>$pare_depth);
					}
				    $this->mysql_model->update(MENU,$datas,'id');
				}
			} else {                       //pid<>0时，顶级转多级  多级转多级
			    $cate = $this->mysql_model->get_row(MENU,'(id='.$pid.')');     //获取原PID数据
				count($cate)<1 && str_alert(-1,'参数错误'); 
			    $pare_pid   = $cate['parentId'];
				$pare_path  = $cate['path'];
				$pare_depth = $cate['level'];
				if ($old_pid==0) {            //顶级转多级  
					if ($old_pid_num==0) {    //ID不存在子栏目
						$this->mysql_model->update(MENU,array('name'=>$name,'parentId'=>$pid,'path'=>$pare_path.','.$id,'level'=>$pare_depth+1),'(id='.$id.')');
					} else {                  //ID存在子栏目 
						$this->mysql_model->update(MENU,array('name'=>$name,'parentId'=>$pid,'path'=>$pare_path.','.$id,'level'=>$pare_depth+1),'(id='.$id.')');
						foreach ($pid_list as $arr=>$row) {
							$path = $pare_path.','.$row['path'];
							$pare_depth = substr_count($path,',')+1;
							$datas[] = array('id'=>$row['id'],'path'=>$path,'level'=>$pare_depth);
						}
						$this->mysql_model->update(MENU,$datas,'id');
					}    
				} else {                      //多级转多级
					if ($old_pid_num==0) {    //ID不存在子栏目
						$this->mysql_model->update(MENU,array('name'=>$name,'parentId'=>$pid,'path'=>$pare_path.','.$id,'level'=>$pare_depth+1),'(id='.$id.')');
					} else {                  //ID存在子栏目 
						$this->mysql_model->update(MENU,array('name'=>$name,'parentId'=>$pid,'path'=>$pare_path.','.$id,'level'=>$pare_depth+1),'(id='.$id.')');
						foreach ($pid_list as $arr=>$row) {
							$path = str_replace($id,'',$old_path);
					        $path = str_replace($path,'',$row['path']);   
							$path = $pare_path.','.$path;
							$pare_depth = substr_count($path,',')+1;
							$datas[] = array('id'=>$row['id'],'path'=>$path,'level'=>$pare_depth+1);
						}
						$this->mysql_model->update(MENU,$datas,'id');
					}
				}
			}
			$data['id']         = intval($id);
			$data['level']      = intval($pare_depth);
			$data['name']       = $name;
			$data['parentId']   = intval($pid);
			$this->common_model->logs('修改类别:ID='.$id.' 名称:'.$data['name']);
			str_alert(200,'success',$data);
		}
		str_alert(-1,'更新失败');
	}
	
	//删除
	public function delete(){
		$this->common_model->checkpurview(59);
		$id   = intval($this->input->get_post('id',TRUE));
		$data = $this->mysql_model->get_row(MENU,'(id='.$id.')'); 
		if (count($data)>0) {
		    $info['isDelete'] = 1;
		    $this->mysql_model->get_count(GOODS,'(MENUId='.$id.')')>0 && str_alert(-1,'辅助资料已经被使用');
			$this->mysql_model->get_count(CONTACT,'(cMENU ='.$id.')')>0 && str_alert(-1,'辅助资料已经被使用');
		    $sql = $this->mysql_model->update(MENU,$info,'(id='.$id.')'); 
		    if ($sql) {
				$this->common_model->logs('删除类别:ID='.$id.' 名称:'.$data['name']);
				str_alert(200,'success',array('msg'=>'删除成功','id'=>'['.$id.']'));
			}
			str_alert(-1,'删除失败');
		}
		str_alert(-1,'分类不存在');
	}

}

/* End of file welcome.php */
/* Location: ./application/controllers/welcome.php */