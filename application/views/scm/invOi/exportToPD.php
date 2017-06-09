<?php if (!defined('BASEPATH')) exit('No direct script access allowed');?>
		<table class="table" width="1500"  border="1">
		        <tr>
				    <td colspan="9" align="center"><H3>盘点表</H3></td>
				</tr>
				<tr>
				    <td width="120" align="center">仓库</td>
					<td width="180" >商品类别</td>
					<td width="100" align="center">商品编号</td>
					<td width="100" align="center">商品名称</td>
					<td width="100" align="center">属性编号</td>	
					<td width="100" align="center">属性名称</td>	
					<td width="120" align="center">规格型号</td>
					<td width="100" align="center">系统库存</td>	
					<td width="100" align="center">盘点库存</td>	
				</tr>
			  <?php 
			  $i = 1;
			  foreach($list as $arr=>$row) { 
			  ?>
				<tr target="id">
					<td ><?php echo $locationId > 0 ? $row['locationName'] : '所有仓库';?></td>
					<td ><?php echo $row['categoryName']?></td>
					<td ><?php echo $row['invNumber']?></td>
					<td ><?php echo $row['invName']?></td>
					<td ><?php echo ''?></td>
					<td ><?php echo ''?></td>
					<td ><?php echo $row['invSpec']?></td>
					<td ><?php echo $row['qty']?></td>
					<td > </td>
				</tr>
				<?php $i++;}?>
</table>	
