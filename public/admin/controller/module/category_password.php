<?php
#############################################################################
   #
#############################################################################
class ControllerModuleCategoryPassword extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('module/category_password');

		$this->document->setTitle( $this->language->get('heading_title'));

		$this->load->model('setting/setting');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && ($this->validate())) {
			$this->model_setting_setting->editSetting('category_password', $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
		}
		
	
		$this->db->query("CREATE  TABLE IF NOT EXISTS `" . DB_PREFIX . "category_password` ( 
  				`category_password_id` int(11) NOT NULL auto_increment, 
  				`category_id` int( 11  )  NOT  NULL default  '0',
 				`password` text  NULL ,
 				PRIMARY KEY  (`category_password_id`)
 	)");
	
	
		$data['heading_title'] = $this->language->get('heading_title');
		$data['enable_category_password'] = $this->language->get('enable_category_password');

  	
		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');

		if (isset($this->error['warning']))
		{
			$data['error_warning'] = $this->error['warning'];
		}
		else
		{
			$data['error_warning'] = '';
		}
		if (isset($this->error['error_sort_order']))
		{
			$data['error_sort_order'] = $this->error['error_sort_order'];
		}
		else
		{
			$data['error_sort_order'] = '';
		}
		if (isset($this->error['error_limit']))
		{
			$data['error_limit'] = $this->error['error_limit'];
		}
		else
		{
			$data['error_limit'] = '';
		}

  	
			$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_module'),
			'href' => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL')
		);

		$data['breadcrumbs'][] = array(
			'text' => $data['heading_title'] ,
			'href' => $this->url->link('module/category_password', 'token=' . $this->session->data['token'], 'SSL')
		);
		$data['action'] = $this->url->link('module/category_password', 'token=' . $this->session->data['token'], 'SSL');

		$data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');

	$data['text_edit'] = $this->language->get('text_edit');
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		if (isset($this->request->post['category_password'])) {
			$data['category_password'] = $this->request->post['category_password'];
		} else {
			$data['category_password'] = $this->config->get('category_password');
		}
		$this->id       = 'category_password';
		$this->template = 'module/category_password.tpl';
		$this->children = array(
			'common/header',	
			'common/footer'	
		);
		
		
		$this->response->setOutput($this->load->view($this->template, $data));
		//$this->response->setOutput($this->render(TRUE), $this->config->get('config_compression'));

 		//$this->render();
	}

	private function validate() {
		if (!$this->user->hasPermission('modify', 'module/category_password')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
	
		if (!$this->error) {
			return TRUE;
		} else {
			return FALSE;
		}
	}
}
?>