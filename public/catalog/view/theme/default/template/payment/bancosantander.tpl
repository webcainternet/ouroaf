<div class="buttons">
  <div class="pull-right">
    <input type="button need_move" onclick="gera_boleto_bancosantander()" value="Confirmar e Gerar Boleto" id="button-confirm" class="btn btn-primary" />
  </div>
</div>


<script type="text/javascript">
<!--
function gera_boleto_bancosantander(){
window.open('<?php echo $url_boleto;?>');
$.ajax({ 
	type: 'get',
	url: 'index.php?route=payment/bancosantander/confirm',
	cache: false,
	beforeSend: function() {
		$('#button-confirm').button('loading');
	},
	complete: function() {
		$('#button-confirm').button('reset');
	},		
	success: function() {
		location = '<?php echo $continue; ?>';
	}		
});
}
//-->
</script>
