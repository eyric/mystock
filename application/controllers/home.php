<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Home extends CI_Controller {

    public function __construct(){
        parent::__construct();
		$this->common_model->checkpurview();
		$this->jxcsys = $this->session->userdata('jxcsys');
    }
	
	public function index(){
	    $data['uid']      = $this->jxcsys['uid'];
		$data['name']     = $this->jxcsys['name'];
		$data['lever']    = $this->jxcsys['lever'];
		$data['username'] = $this->jxcsys['username']; 
        $data['system']   = $this->common_model->get_option('system'); 
		$this->load->view('index',$data);
	}
	
	//右边内容
	public function main(){
		$this->load->view('main');
	}
	
	//修改个人信息
	public function set_password(){
		$data = str_enhtml($this->input->post(NULL,TRUE));
		if (is_array($data)&&count($data)>0) {
			$info['userpwd'] = md5($data['newPassword']);
			$info['mobile']  = $data['buyerMobile'];
			$info['name']    = $data['buyerName'];
			$this->mysql_model->get_count(ADMIN,'(uid<>'.$this->jxcsys['uid'].') and mobile='.$info['mobile'].'') >0 && str_alert(-1,'该手机号已被使用,请更换手机号码'); 
		    $sql = $this->mysql_model->update(ADMIN,$info,'(uid='.$this->jxcsys['uid'].')');
			if ($sql) {
				$this->common_model->logs('密码修改成功 UID：'.$this->jxcsys['uid'].' 真实姓名改为：'.$info['name']);
				str_alert(200,'密码修改成功');
			}
			str_alert(-1,'设置独立密码失败，请稍候重试！');
		} else {
		    $data = $this->mysql_model->get_row(ADMIN,'(uid='.$this->jxcsys['uid'].')');    
		    $this->load->view('set_password',$data);
		}
	}
	
	//清理缓存
	public function clear(){
		if ($this->mysql_model->clean()) {
		    die('1');
		} else {
		    die('0');
		}
	}

	
}

/* End of file welcome.php */
/* Location: ./application/controllers/welcome.php */