<style>
.home-banner {
	float: left;
	border: solid 10px #FAFAFA;
	width: 573px;
	margin: 5px;
	transition: border .2s ease-in-out;
  -webkit-transition: border .2s ease-in-out;
  -moz-transition: border .2s ease-in-out;
}
.home-banner:hover{
  border: solid 10px #D1A32D;
}
.home-banner-1 {
	height: 250px;
	background: url('image/aliancas.jpg');
  background-size: cover;
  background-repeat: no-repeat;
  background-color: #f0efed;
  background-position: -460px 25px;
	opacity:0.7;
	transition: opacity .2s ease-in-out;
	-webkit-transition: opacity .2s ease-in-out;
	-moz-transition: opacity .2s ease-in-out;
}
.home-banner-1:hover {
	opacity:1;
}
.home-banner-2 {
	height: 460px;
	float: right;
	background: url('/image/banner2.jpg');
	background-size: cover;
	opacity:0.7;
	transition: opacity .2s ease-in-out;
	-webkit-transition: opacity .2s ease-in-out;
	-moz-transition: opacity .2s ease-in-out;
}
.home-banner-2:hover {
	opacity:1;
}

.home-banner-3 {
	height: 200px;
  background: #bef2ff;
	color: #333;
	opacity:0.7;
	transition: color .2s ease-in-out;
	-webkit-transition: color .2s ease-in-out;
	-moz-transition: color .2s ease-in-out;
	transition: background .2s ease-in-out;
	-webkit-transition: background .2s ease-in-out;
	-moz-transition: background .2s ease-in-out;
}
.home-banner-3:hover {
	background: #D1A32D;
	color: #FFF;
}
.home-banner-4 {
	height: 220px;
	width: 379px;
	background: url('/image/relogios.jpg');
	background-size: cover;
	background-position: 0px -90px;
	opacity:0.7;
	transition: opacity .2s ease-in-out;
	-webkit-transition: opacity .2s ease-in-out;
	-moz-transition: opacity .2s ease-in-out;
}
.home-banner-4:hover {
	opacity:1;
}
.home-banner-5 {
	height: 220px;
	width: 379px;
	background-color: #555;
	transition: background-color .2s ease-in-out;
	-webkit-transition: background-color .2s ease-in-out;
	-moz-transition: background-color .2s ease-in-out;
}
.home-banner-5:hover {
	background-color: #333;
}
.home-banner-6 {
	height: 220px;
	width: 379px;
	background: url('/image/pingente.jpg');
	background-size: cover;
	background-position: 0px -160px;
	opacity:0.7;
	transition: opacity .2s ease-in-out;
	-webkit-transition: opacity .2s ease-in-out;
	-moz-transition: opacity .2s ease-in-out;
}
.home-banner-6:hover {
	opacity:1;
}
</style>

<div>

	<div class="home-banner home-banner-1">
		<div style="	color: #D1A32D;
			text-transform: uppercase;
			text-align: left;
			margin-top: 20px;
			margin-left: 20px;
			font-size: 24px;">Aneis e Alianças</div>
	</div>

	<div class="home-banner home-banner-2">
		<div style="    padding: 30px;
	    text-align: center;
	    background: #e1e2dd;
	    margin-top: 260px;
	    font-size: 24px;
	    color: #333;
	    text-transform: uppercase;">Linha University</div>
	</div>

	<div class="home-banner home-banner-3">
		<div style="text-transform: uppercase;
	    text-align: center;
	    margin-top: 79px;
	    font-size: 24px;">Comissão de Formatura</div>
	</div>

	<div class="home-banner home-banner-4">
		<div style="    color: #FFF;
	    text-transform: uppercase;
	    text-align: right;
	    margin-top: 160px;
	    margin-right: 20px;
	    font-size: 24px;">Relógios</div>
	</div>

	<div class="home-banner home-banner-5">
		<div style="color: #FFF;
	    text-transform: uppercase;
	    text-align: center;
	    margin-top: 75px;
	    font-size: 24px;"><i class="fa fa-user" style="font-size: 60px;" aria-hidden="true"></i>

				<br><br>Acesso Restrito</div>
	</div>

	<div class="home-banner home-banner-6">
		<div style="	color: #FFF;
	    text-transform: uppercase;
	    text-align: left;
	    margin-top: 20px;
	    margin-left: 20px;
	    font-size: 24px;">Pingentes</div>
	</div>

</div>

<hr>


<div class="box featured" style="margin-top: 700px;">
	<div class="box-heading"><h3><?php echo $heading_title; ?></h3></div>
	<div class="box-content">
		<div class="row">
		<?php $f=0; foreach ($products as $product) { $f++ ?>
		<div class="product-layout col-lg-3 col-md-3 col-sm-3 col-xs-12">
			<div class="product-thumb transition">

				<div class="quick_info">
					<div id="quickview_<?php echo $f?>">
						<div>
							<div class="left col-sm-4">
								<div class="quickview_image image"><a href="<?php echo $product['href']; ?>"><img alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" src="<?php echo $product['thumb']; ?>" /></a></div>
								</div>
								<div class="right col-sm-8">
									<h2><?php echo $product['name']; ?></h2>
									<div class="inf">
										<?php if ($product['author']) {?>
											<p class="quickview_manufacture manufacture manufacture"><?php echo $text_manufacturer; ?> <a href="<?php echo $product['manufacturers'];?>"><?php echo $product['author']; ?></a></p>
										<?php }?>
										<?php if ($product['model']) {?>
											<p class="product_model model"><?php echo $text_model; ?> <?php echo $product['model']; ?></p>
										<?php }?>

										<?php if ($product['price']) { ?>
                        <div class="price">
                            <?php if (!$product['special']) { ?>
                                <?php echo $product['price']; ?>
                            <?php } else { ?>
                                <span
                                    class="price-new"><?php echo $product['special']; ?></span>
                                <span class="price-old"><?php echo $product['price']; ?></span>
                            <?php } ?>
                            <?php include $_SERVER['DOCUMENT_ROOT'] . '/catalog/view/theme/theme555/parcelamento.php'; ?>
                            <?php if ($product['tax']) { ?>
                                <span
                                    class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
                            <?php } ?>
                        </div>
                    <?php } ?>
									</div>
									<div class="cart-button">
										<button class="btn btn-icon btn-add" data-toggle="tooltip" title="<?php echo $button_cart; ?>" type="button" onclick="cart.add('<?php echo $product['product_id']; ?>');"><i class="material-design-shopping231"></i></button>

									</div>
									<div class="clear"></div>
									<div class="rating">
										<?php for ($i = 1; $i <= 5; $i++) { ?>
										<?php if ($product['rating'] < $i) { ?>
										<span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i></span>
										<?php } else { ?>
										<span class="fa fa-stack"><i class="fa fa-star active fa-stack-2x"></i></span>
										<?php } ?>
										<?php } ?>
									</div>

								</div>
								<div class="col-sm-12">
									<div class="quickview_description description">
										<?php echo $product['description1'];?>
									</div>
								</div>
						</div>
					</div>
				</div>

			<div class="image">
				<a class="lazy" style="padding-bottom: <?php echo ($product['img-height']/$product['img-width']*100); ?>%"
					href="<?php echo $product['href']; ?>"> <img alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" data-src="<?php echo $product['thumb']; ?>" src="#"/>
				</a>

				<div class="stickers">
				<?php
				$arr_last = $product['last_array'];
				foreach( $arr_last as $value ){
					if ($product['product_id']==$value) { ?>
						<div class="new_pr"><?php echo $text_new; ?></div>
						<?php }
					}
				?>
				<?php if ($product['special']) { ?>
					<div class="sale"><?php echo $text_sale; ?></div>
				<?php } ?>
				</div>

			</div>
			<div class="caption">
				<div class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>

				<?php if ($product['price']) { ?>
				<div class="price">
				<?php if (!$product['special']) { ?>
				<?php echo $product['price']; ?>
				<?php } else { ?>
				<span class="price-new"><?php echo $product['special']; ?></span> <span class="price-old"><?php echo $product['price']; ?></span>
				<?php } ?>
				<?php if ($product['tax']) { ?>
				<span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
				<?php } ?>
				</div>
				<?php } ?>
			</div>
			<div class="cart-button">
				<button class="product-btn-add" type="button" onclick="cart.add('<?php echo $product['product_id']; ?>');">
					<i class="material-design-shopping231"></i> <span class="hidden-sm"><?php echo $button_cart; ?></span>
				</button>


				<div class="rating">
				<?php for ($i = 1; $i <= 5; $i++) { ?>
				<?php if ($product['rating'] < $i) { ?>
				<span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i></span>
				<?php } else { ?>
				<span class="fa fa-stack"><i class="fa fa-star active fa-stack-2x"></i></span>
				<?php } ?>
				<?php } ?>
				</div>

			</div>
			</div>
		</div>
		<?php } ?>
		</div>
	</div>
</div>
