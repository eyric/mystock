<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Service extends CI_Controller {

    public function __construct(){
        parent::__construct();
		$this->common_model->checkpurview();
    }
	
    //意见反馈
	public function index() {
		$this->load->view('service');	
	}
	
	
	//初始化数据
	public function recover() {
	    $this->common_model->checkpurview(149);
	    $this->config = $this->config->config;
	    $data = read_file($this->config['initial_sql']);
		if ($data) {
		    $this->db->trans_begin();
			$list = explode(";\n",$data);
			foreach ($list as $sql) {
				$this->db->query($sql);
			}
			if ($this->db->trans_status() === FALSE) {
			    $this->db->trans_rollback();
				str_alert(-1,'初始化数据失败');   
			} else {
			    $this->db->trans_commit();
				$this->common_model->logs('初始化数据成功');
			    str_alert(200,'success');
			}
		}
		str_alert(-1,'初始化数据失败');   
	}
	
	
	 
	 
}

/* End of file welcome.php */
/* Location: ./application/controllers/welcome.php */