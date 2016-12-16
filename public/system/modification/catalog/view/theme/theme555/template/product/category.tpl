<?php echo $header; ?>
<?php
$_SESSION['use_category_password'] = 1;
$_SESSION['use_product_password'] = 1;
?>
<div class="container">
  <ul class="breadcrumb">
	<?php foreach ($breadcrumbs as $breadcrumb) { ?>
	<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
	<?php } ?>
  </ul>
  <div class="row"><?php echo $column_left; ?>
	<?php if ($column_left && $column_right) { ?>
	<?php $class = 'col-sm-6'; ?>
	<?php } elseif ($column_left || $column_right) { ?>
	<?php $class = 'col-sm-9'; ?>
	<?php } else { ?>
	<?php $class = 'col-sm-12'; ?>
	<?php } ?>
	<div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
	  <h2><?php echo $heading_title; ?></h2>
	  <?php if ($thumb || $description) { ?>
	  <div class="row">
		<?php if ($thumb) { ?>
		<div class="col-sm-2">
			<div class="image">
				<img src="<?php echo $thumb; ?>" alt="<?php echo $heading_title; ?>" title="<?php echo $heading_title; ?>" class="img-thumbnail" />
			</div>
		</div>
		<?php } ?>
		<?php if ($description) { ?>
		<div class="col-sm-10"><?php echo $description; ?></div>
		<?php } ?>
	  </div>
	  <br><br>
	  <?php } ?>
	  <?php if ($categories) { ?>
	  <h3><?php echo $text_refine; ?></h3>
	  
	  <div class="row">
		<div >
		  <ul class="box-subcat">
			<?php $i=0; foreach ($categories as $category) { $i++; ?>
				<?php 
			   $perLine = 6;
			   $last_line = "";
							$total = count($products);
							$totModule = $total%$perLine;
							if ($totModule == 0)  { $totModule = $perLine;}
							if ( $i > $total - $totModule) { $last_line = " last_line";}
							if ($i%$perLine==1) {
								$a='first-in-line';
							}
							elseif ($i%$perLine==0) {
								$a='last-in-line';
							}
							else {
								$a='';
							}
						?>
			<li class="col-sm-2 <?php echo $a. $last_line ;?>">
				<?php if ($category['thumb']) { ?>
					<div class="image"><a href="<?php echo $category['href']; ?>"><img src="<?php echo $category['thumb']; ?>" alt="<?php echo $category['name']; ?>" /></a></div>
				<?php } ?>
				<div class="name subcatname"><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></div>
			</li>
			<?php } ?>
		  </ul>
		</div>
	  </div>
	  
	  <?php } ?>
	  <?php if ($products) { ?>
		<div class="product-filter clearfix">
			<div class="row">
				<div class="col-md-2">
					<label class="control-label" for="input-sort"><?php echo $text_sort; ?></label>
				</div>
				<div class="col-md-3">
					<select id="input-sort" class="form-control col-sm-3" onchange="location = this.value;">
						<?php foreach ($sorts as $sorts) { ?>
						<?php if ($sorts['value'] == $sort . '-' . $order) { ?>
						<option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
						<?php } else { ?>
						<option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
						<?php } ?>
						<?php } ?>
					</select>
				</div>
				<div class="col-md-2">
					<label class="control-label" for="input-limit"><?php echo $text_limit; ?></label>
				</div>
				<div class="col-md-2">
					<select id="input-limit" class="form-control" onchange="location = this.value;">
						<?php foreach ($limits as $limits) { ?>
						<?php if ($limits['value'] == $limit) { ?>
						<option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
						<?php } else { ?>
						<option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
						<?php } ?>
						<?php } ?>
					</select>
				</div>
				<div class="col-md-3 text-right">
					<div class="button-view">
						<button type="button" id="list-view" class="btn btn-default" data-toggle="tooltip" title="<?php echo $button_list; ?>"><i class="fa fa-th-list"></i></button>
						<button type="button" id="grid-view" class="btn btn-default" data-toggle="tooltip" title="<?php echo $button_grid; ?>"><i class="fa fa-th"></i></button>
					</div>
				</div>
			</div>
		</div>
		<div class="nav-cat clearfix">
			<div class="pull-left"><?php echo $pagination; ?></div>
			<div class="pull-left nam-page"><?php echo $results; ?></div>
			<div class="pull-right">
				<a href="<?php echo $compare; ?>" id="compare-total">
					<?php echo $text_compare; ?>
					<i class="fa fa-chevron-right"></i>
				</a>
			</div>
		</div>
	  <div class="row">
		
			<?php foreach ($products as $product) {
				if(isset($_SESSION['use_product_password'])){
		
		$newpid = $product['product_id'];
				$protected = true;
				$product_password = '';	
				$pquery3 = $db->query("SELECT product_id,password FROM " . DB_PREFIX . "product_password WHERE product_id = '" . $newpid . "'");
				$categ = $pquery3->rows ;
				if(is_array($categ) && sizeof($categ)>0){
				foreach($categ as $caterow)
				$product_password=$caterow['password'];
				}
	
			if(!isset($_SESSION['passed_product'])) $_SESSION['passed_product']=array();
		
				if(is_array($categ) && sizeof($categ)>0){
				foreach($categ as $caterow){
				$product_password=$caterow['password'];
					if($product_password=='' || in_array($caterow['product_id'],$_SESSION['passed_product']))
					$protected = false;
					
					}
				}else
				$protected = false;
				
				
				if($protected){
					$product['thumb']=$placeholdimage;
					$product['price']=false;
					$product['description']='';
				}
					
		}
			 ?>
			
		<div class="product-layout product-list col-xs-12">
		  <div class="product-thumb">
			<div class="image">
				<a class="lazy" style="padding-bottom: <?php echo ($product['img-height']/$product['img-width']*100); ?>%" href="<?php echo $product['href']; ?>"> <img alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" data-src="<?php echo $product['thumb']; ?>" src="#"/> </a>
				
				<div class="stickers">
				<?php  
				$arr_last = $product['last_array'];
				foreach( $arr_last as $value ){
					if ($product['product_id']==$value) {								
						?>
						<div class="new_pr"><?php echo $text_new; ?></div>
						<?php
						}  
					}
				?>
				<?php if ($product['special']) { ?>
						<div class="sale"><?php echo $text_sale; ?></div>		
				<?php } ?>
				</div>
				
			</div>
			<div>
			  <div class="caption">
				<div class="name name-product"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
				
				<div class="description-small"><?php echo mb_substr($product['description'],0,62,'UTF-8').'...'; ?></div>
				<div class="description"><?php echo $product['description']; ?></div>				
				
				<?php if ($product['price']) { ?>
				<div class="price price-product">
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
					
	<button type="button" onclick="<?php
			/*sunflowerbiz start*/
		if(isset($_SESSION['use_product_password'])){
				if($protected){
					echo 'location.href=\'index.php?route=product/product&product_id='.$newpid.'\';return false;';
				}
		} ?>cart.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-shopping-cart"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $button_cart; ?></span></button>
				
					<div class="row">					
					<button class="product-btn" type="button" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i class="material-design-favorite22"></i></button><button class="product-btn" type="button" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');"><i class="material-design-shuffle24"></i></button><a class="product-btn" data-toggle="tooltip" title="<?php echo $text_details; ?>" href="<?php echo $product['href']; ?>"><i class="material-design-right244"></i></a>
					</div>
				
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
				<div class="clear"></div>
		  </div>
		</div>
		<?php } ?>
	  </div>
	  <div class="row">
		<div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
		<div class="col-sm-6 text-right"><?php echo $results; ?></div>
	  </div>
	  <?php } ?>
	  <?php if (!$categories && !$products) { ?>
	  <p><?php echo $text_empty; ?></p>
	  <div class="buttons" style="display: none;">
		<div class="pull-right"><a href="<?php echo $continue; ?>" class="btn"><?php echo $button_continue; ?></a></div>
	  </div>
	  <?php } ?>
	  <?php echo $content_bottom; ?></div>
	<?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>