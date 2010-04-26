<cfcomponent
	displayname="FileType"
	output="false"
	hint="A bean which models the FileType form.">

<!--- This bean was generated by the Rooibos Generator with the following template:
Bean Name: FileType
Path to Bean: 
Extends: 
Call super.init(): false
Create cfproperties: false
Bean Template:
	fileTypeID string 
	fileType string 
	fileExtension string 
	audit org.capitolhillusergroup.audit.Audit #createObject('component', 'org.capitolhillusergroup.audit.Audit')#
Create getMemento method: false
Create setMemento method: false
Create setStepInstance method: false
Create validate method: false
Create validate interior: false
Date Format: MM/DD/YYYY
--->

	<!---
	PROPERTIES
	--->
	<cfset variables.instance = StructNew() />

	<!---
	INITIALIZATION / CONFIGURATION
	--->
	<cffunction name="init" access="public" returntype="FileType" output="false">
		<cfargument name="fileTypeID" type="string" required="false" default="" />
		<cfargument name="fileType" type="string" required="false" default="" />
		<cfargument name="fileExtension" type="string" required="false" default="" />
		<cfargument name="audit" type="org.capitolhillusergroup.audit.Audit" required="false" 
				default="#createObject('component', 'org.capitolhillusergroup.audit.Audit').init()#" />

		<!--- run setters --->
		<cfset setFileTypeID(arguments.fileTypeID) />
		<cfset setFileType(arguments.fileType) />
		<cfset setFileExtension(arguments.fileExtension) />
		<cfset setAudit(arguments.audit) />

		<cfreturn this />
 	</cffunction>

	<!---
	ACCESSORS
	--->
	<cffunction name="setFileTypeID" access="public" returntype="void" output="false">
		<cfargument name="fileTypeID" type="string" required="true" />
		<cfset variables.instance.fileTypeID = arguments.fileTypeID />
	</cffunction>
	<cffunction name="getFileTypeID" access="public" returntype="string" output="false">
		<cfreturn variables.instance.fileTypeID />
	</cffunction>

	<cffunction name="setFileType" access="public" returntype="void" output="false">
		<cfargument name="fileType" type="string" required="true" />
		<cfset variables.instance.fileType = arguments.fileType />
	</cffunction>
	<cffunction name="getFileType" access="public" returntype="string" output="false">
		<cfreturn variables.instance.fileType />
	</cffunction>

	<cffunction name="setFileExtension" access="public" returntype="void" output="false">
		<cfargument name="fileExtension" type="string" required="true" />
		<cfset variables.instance.fileExtension = arguments.fileExtension />
	</cffunction>
	<cffunction name="getFileExtension" access="public" returntype="string" output="false">
		<cfreturn variables.instance.fileExtension />
	</cffunction>

	<cffunction name="setAudit" access="public" returntype="void" output="false">
		<cfargument name="audit" type="org.capitolhillusergroup.audit.Audit" required="true" />
		<cfset variables.instance.audit = arguments.audit />
	</cffunction>
	<cffunction name="getAudit" access="public" returntype="org.capitolhillusergroup.audit.Audit" output="false">
		<cfreturn variables.instance.audit />
	</cffunction>

</cfcomponent>