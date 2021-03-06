<cfoutput>
	<h2>#action#</h2>
	
	<cfif event.isArgDefined("message")>
		<p class="message">#event.getArg("message")#</p>
	</cfif>
	
	<form id="stateUploadForm" class="standardForm" action="#BuildUrl('admin.processUploadStatesForm')#" method="post" enctype="multipart/form-data">
		
		<fieldset>	
			
			<label for="stateUpload"><span class="label"><span class="required">*</span>#getProperty("resourceBundleService").getResourceBundle().getResource("uploadfile")#</span>
				<input type="file" id="uploadfile" name="uploadfile" /><br />
			</label>
			
			<div class="submit-wrap">
				<input type="submit" value="#action#" class="submit" tabindex="4" /><br />
			</div>
			
		</fieldset>	
	</form>
	
	<script type="text/javascript">
		<!--//--><![CDATA[//><!--
		objForm = new qForm("stateUploadForm");
		objForm.uploadfile.required = true;
		objForm.uploadfile.description = "#getProperty("resourceBundleService").getResourceBundle().getResource("uploadfile")#";
		//--><!]]>
	</script>
</cfoutput>