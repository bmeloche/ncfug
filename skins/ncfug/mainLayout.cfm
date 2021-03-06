<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<cfoutput>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>#event.getArg("pageTitle", getProperty("siteName"))#</title>
<link href="#getProperty('baseURL')#skins/#getProperty('skin')#/stylesheets/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="#getProperty('baseURL')#js/jquery-1.2.6.pack.js"></script>
<script type="text/javascript">
<!--
	$(document).ready(function(){

		$('##suggest').hover(function(){
			$(this).attr('src','#getProperty('applicationRoot')#skins/#getProperty('skin')#/images/suggest-meeting-topics-over.gif');
		},function(){
			$(this).attr('src','#getProperty('applicationRoot')#skins/#getProperty('skin')#/images/suggest-meeting-topics.gif');
		});

	});

//-->
</script>
	<!--- include the form validation libraries if needed --->
	<cfif event.isArgDefined("includeqForms") AND event.getArg("includeqForms")>
		<script type="text/javascript" src="#getProperty('baseURL')#js/lib/qforms.js"></script>
		<script type="text/javascript">
			<!--//--><![CDATA[//><!--
			qFormAPI.setLibraryPath("#getProperty('baseURL')#js/lib/");
			qFormAPI.include("*");
			//--><!]]>
		</script>
	</cfif>
		<!--- include the calendar if needed --->	
	<cfif event.isArgDefined("includeCalendar") AND event.getArg("includeCalendar")>
		<style type="text/css">@import url(#getProperty('baseURL')#js/calendar/skins/aqua/theme.css);</style>
		<script type="text/javascript" src="#getProperty('baseURL')#js/calendar/calendar.js"></script>
		<script type="text/javascript" src="#getProperty('baseURL')#js/calendar/lang/calendar-en.js"></script>
		<script type="text/javascript" src="#getProperty('baseURL')#js/calendar/calendar-setup.js"></script>
	</cfif>
	<link rel="shortcut icon" href="#getProperty('baseURL')#skins/#getProperty('skin')#/images/favicon.ico">	
</head>
<body>
	<!-- Start Header -->
	<div id="header">
		<div class="container">
			<h1><a href="/" title="#getProperty("siteName")#">#getProperty("siteName")#<span></span></a></h1>
<hr />
			<!-- top navigation -->
			<ul id="navigation">
				
					<li <cfif event.getRequestName() is "home"> class="active"</cfif>>
						<a href="#getProperty('baseURL')#">
							#getProperty("resourceBundleService").getResourceBundle().getResource("home")#
						</a>
					
					</li>
					
					<li <cfif event.getRequestName() is "meetings" or event.getRequestName() is "meeting"> class="active"</cfif>>						
						<a href="#BuildUrl('meetings')#">
							#getProperty("resourceBundleService").getResourceBundle().getResource("meetings")#
						</a>
					</li>
					<li <cfif event.getRequestName() is "news"> class="active"</cfif>>
						<a href="#BuildUrl('news')#">
							#getProperty("resourceBundleService").getResourceBundle().getResource("news")#
						</a>
					</li> 
					<li <cfif event.getRequestName() is "articles"> class="active"</cfif>>
						<a href="#BuildUrl('articles')#">
							#getProperty("resourceBundleService").getResourceBundle().getResource("articles")#
						</a>
					</li>
					<!--- <li>
						<a<cfif event.getRequestName() is "showBooks"> id="selected"</cfif> href="index.cfm?#getProperty('eventParameter')#=showBooks">
							#getProperty("resourceBundleService").getResourceBundle().getResource("books")#
						</a>
					</li>
					<li>
						<a<cfif event.getRequestName() is "showPhotos"> id="selected"</cfif> href="index.cfm?#getProperty('eventParameter')#=showPhotos">
							#getProperty("resourceBundleService").getResourceBundle().getResource("photos")#
						</a>
					</li> --->
					<li <cfif event.getRequestName() is "board"> class="active"</cfif>>
						<a href="#BuildUrl('board')#">
							#getProperty("resourceBundleService").getResourceBundle().getResource("board")#
						</a>
					</li>
					<li <cfif event.getRequestName() is "contact"> class="active"</cfif>>
						<a href="#BuildUrl('contact')#">
							#getProperty("resourceBundleService").getResourceBundle().getResource("contact")#
						</a>
					</li>
				
				
			</ul>
			<hr />
			<!-- banner message and building background -->
			<div id="banner">
				The Nashville ColdFusion User Group is an official <a href="http://www.adobe.com/cfusion/usergroups/index.cfm" target="_blank">Adobe User Group</a> 
		for all developers in the Nashville Tennessee area that are seeking to learn more about Adobe development platforms.
			</div>
			<hr />
		</div>
	</div>
	<!-- Start Main Content -->
	<div id="main" class="container">
	
	
	
	
		<!-- left column (products and features) -->
		<div id="leftcolumn">
			
			

			
			
			<h3 class="leftbox header_small">#getProperty("resourceBundleService").getResourceBundle().getResource("upcomingmeetings")#</h3>
			<div class="leftbox features">
			<cfif arrayLen(upcomingMeetings) gt 0>
						<cfloop index="i" from="1" to="#arrayLen(upcomingMeetings)#" step="1">
							<cfif nextMeeting.getLocation().getMapLink() is not "">
								<cfset tempLinkMain = Replace(nextMeeting.getLocation().getMapLink(),"&","&amp;","ALL")>
							</cfif>
								<h2>#getProperty("resourceBundleService").getLocaleUtils().i18nDateTimeFormat(upcomingMeetings[i].getDTMeeting(), 3, 3)#</h2>
								<p><a href="#BuildUrl('meeting', 'meetingID=#upcomingMeetings[i].getMeetingID()#')#">#upcomingMeetings[i].getTitle()#</a></p>
								<p>#upcomingMeetings[i].getLocation().getLocation()#<br/>
								#nextMeeting.getLocation().getAddress().getAddress1()#,<br />
								#nextMeeting.getLocation().getAddress().getCity()#, #nextMeeting.getLocation().getAddress().getState()# #nextMeeting.getLocation().getAddress().getPostalCode()#</p>
								<cfif isDefined("tempLinkMain")>
									<p><a href="#tempLinkMain#" target="_blank">#getProperty("resourceBundleService").getResourceBundle().getResource("mapoflocation")#</a></p>
								</cfif>
								<p><a href="#BuildUrl('rsvpform', 'meetingID=#nextMeeting.getMeetingID()#')#">#getProperty("resourceBundleService").getResourceBundle().getResource("rsvpforthismeeting")#</a></p>
							
						</cfloop>
					<cfelse>
						#getProperty("resourceBundleService").getResourceBundle().getResource("noupcomingmeetings")#
						
					</cfif>
			</div>
		
		
	
			<cfif news.recordCount gt 0>
			<h3 class="leftbox header_small">#getProperty("resourceBundleService").getResourceBundle().getResource("latestnews")#</h3>
			<div class="leftbox features">
				<cfloop query="news">
						<p>
						#getProperty("resourceBundleService").getLocaleUtils().i18nDateTimeFormat(news.dt_to_post, 3, 3)#<br/>
						#news.headline#<br/>
						<a href="#BuildUrl('newsdetail', 'newsID=#news.news_id#')#">#getProperty("resourceBundleService").getResourceBundle().getResource("readmore")#</a>
						</p>
				</cfloop>
			</div>
			</cfif>
	
		<cfif event.getArg("authType") is "admin">		
			<h3 class="leftbox">#getProperty("resourceBundleService").getResourceBundle().getResource("adminlinks")#</h3>
			<ul class="leftbox borderedlist">
								<li>
									<a href="#BuildUrl('admin.showMainMenu')#">
										#getProperty("resourceBundleService").getResourceBundle().getResource("adminmenu")#
									</a>
								</li>
								<li>
									<a href="#BuildUrl('admin.showArticleMenu')#">
										#getProperty("resourceBundleService").getResourceBundle().getResource("managearticles")#
									</a>
								</li>
								<li>
									<a href="#BuildUrl('admin.showBookMenu')#">
										#getProperty("resourceBundleService").getResourceBundle().getResource("managebooks")#
									</a>
								</li>
								<li>
									<a href="#BuildUrl('admin.showMeetingMenu')#">
										#getProperty("resourceBundleService").getResourceBundle().getResource("managemeetings")#
									</a>
								</li>
								<li>
									<a href="#BuildUrl('admin.showNewsMenu')#">
										#getProperty("resourceBundleService").getResourceBundle().getResource("managenews")#
									</a>
								</li>
								<li>
									<a href="#BuildUrl('admin.showPeopleMenu')#">
										#getProperty("resourceBundleService").getResourceBundle().getResource("managepeople")#
									</a>
								</li>
								<li>
									<a href="#BuildUrl('admin.showPhotoMenu')#">
										#getProperty("resourceBundleService").getResourceBundle().getResource("managephotos")#
									</a>
								</li>
							</ul>
			</ul>
		</cfif>	
		
		<cfif event.getArg("authType") is "admin" or event.getArg("authType") is "member">
		<h3 class="leftbox">#getProperty("resourceBundleService").getResourceBundle().getResource("memberlinks")#</h3>
				<ul class="leftbox borderedlist">
								<li>
									<a href="#BuildUrl('member.showMainMenu')#">
										#getProperty("resourceBundleService").getResourceBundle().getResource("membermenu")#
									</a>
								</li>
								<li>
									<a href="#BuildUrl('member.showPersonForm')#">
										#getProperty("resourceBundleService").getResourceBundle().getResource("manageyourprofile")#
									</a>
								</li>
							</ul>
	
		</cfif>
		</div>
		
		<hr />
		
		<!-- main content area -->
		<div id="center">
			<div class="article_wrapper">
				#event.getArg("content")#
			</div>

			<hr />
		</div>
		<!-- product sales boxes -->
		<div id="rightcolumn">

		<a href="#BuildUrl('contact')#"><img src="#getProperty('applicationRoot')#skins/#getProperty('skin')#/images/suggest-meeting-topics.gif" id="suggest"/></a>
		<br />
		<br />

		<a href="http://www.adobe.com/cfusion/usergroups/index.cfm" target="_blank"><img src="#getProperty('applicationRoot')#skins/#getProperty('skin')#/images/adobe_user_group_badge.jpg" /></a> 
		<br />
		<br />			

		<!-- Sponsors -->
		<!--- <a href="http://www.producealliance.com/" target="_blank"><img src="#getProperty('applicationRoot')#skins/#getProperty('skin')#/images/sponsors/producealliance.gif" /></a> 
		<br />
		<br /> --->

		<!--- <a href="http://www.dealerskins.com/" target="_blank"><img src="#getProperty('applicationRoot')#skins/#getProperty('skin')#/images/sponsors/dealerskins.gif" /></a> 
		<br />
		<br /> --->
		
		<!--- <a href="http://www.vaco.com/" target="_blank"><img src="#getProperty('applicationRoot')#skins/#getProperty('skin')#/images/sponsors/vacotechnology.gif" /></a> 
		<br />
		<br /> --->
		
		<!--- <a href="http://www.spotonpm.com/" target="_blank"><img src="#getProperty('applicationRoot')#skins/#getProperty('skin')#/images/sponsors/otis-technologies.gif" /></a> 
		<br />
		<br /> --->

		<!--- <a href="http://www.echurchonline.com/" target="_blank"><img src="#getProperty('applicationRoot')#skins/#getProperty('skin')#/images/sponsors/echurchonline.gif" /></a> 
		<br />
		<br /> --->
		
		<hr /> 
		</div>
	</div>
	<!-- Start Bottom Information -->
	<div id="bottominfo">
		<div class="container">
			<!-- bottom left information -->
			<div class="bottomcolumn">
				<h3>#getProperty("resourceBundleService").getResourceBundle().getResource("links")#</h3>
				<p>Great links to help you learn all about fine Adobe Products</p>
				<ul class="borderedlist iconlist">
							<li><a href="http://www.adobe.com/cfusion/usergroups/index.cfm" target="_blank">Adobe User Groups</a></li>
							<li><a href="http://www.adobe.com/products/coldfusion" target="_blank">ColdFusion</a></li>
							<li><a href="http://www.adobe.com/products/flex" target="_blank">Flex</a></li>
							<li><a href="http://www.adobe.com/go/air/" target="_blank">AIR</a></li>

				</ul>
			</div>
			<!-- bottom center information -->
			<div class="bottomcolumn">
				<h3>Blog Roll</h3>
				<p>Here is a list of members who are active ColdFusion bloggers.</p>
				<ul class="borderedlist iconlist">
					<li><a href="http://www.aaronwest.net/blog" title="Aaron West's Blog" target="_blank">Aaron West</a></li>
					<li><a href="http://jeremiahx.com" title="The Blog of J.J. Merrick" target="_blank">J.J. Merrick</a></li>
					<li><a href="http://www.cfgears.com" title="Eric Cobb's Blog'" target="_blank">Eric Cobb</a></li>
					<li><a href="http://coldfusionbloggers.org/" title="ColdFusionBloggers.org" target="_blank">ColdFusion Bloggers</a></li>
				</ul>
			</div>
			<!-- bottom right information -->
			<div class="bottomcolumn bottomright">
				<h3>Stay Informed</h3>
				<p>Click each link below to subscribe to our e-mail lists.</p>
				<a href="mailto:announcements@ncfug.com?subject=Subscribe">announcements@ncfug.com</a> (read only)<br/>
				<a href="mailto:talk@ncfug.com?subject=Subscribe">talk@ncfug.com</a> (on and off topic posts allowed)<br/>
				<a href="mailto:work@ncfug.com?subject=Subscribe">work@ncfug.com</a> (on topic posts only)<br/>
			</div>
			<hr />
		</div>
	</div>
	<!-- Start Footer -->
	<div id="footer">
		<div class="container">
			<a id="designby" href="http://www.studio7designs.com/" title="Design by STUDIO7DESIGNS" target="_blank">WEB DESIGN BY STUDIO7DESIGNS</a>
			<ul id="footer_navigation">
					<li <cfif event.getRequestName() is "home"> class="active"</cfif>>
						<a href="#getProperty('baseURL')#">
							#getProperty("resourceBundleService").getResourceBundle().getResource("home")#
						</a>
					
					</li>
					
					<li <cfif event.getRequestName() is "meetings" or event.getRequestName() is "meeting"> class="active"</cfif>>						
						<a href="#BuildUrl('meetings')#">
							#getProperty("resourceBundleService").getResourceBundle().getResource("meetings")#
						</a>
					</li>
					<li <cfif event.getRequestName() is "news"> class="active"</cfif>>
						<a href="#BuildUrl('news')#">
							#getProperty("resourceBundleService").getResourceBundle().getResource("news")#
						</a>
					</li> 
					<li <cfif event.getRequestName() is "articles"> class="active"</cfif>>
						<a href="#BuildUrl('articles')#">
							#getProperty("resourceBundleService").getResourceBundle().getResource("articles")#
						</a>
					</li>
					<!--- <li>
						<a<cfif event.getRequestName() is "showBooks"> id="selected"</cfif> href="index.cfm?#getProperty('eventParameter')#=showBooks">
							#getProperty("resourceBundleService").getResourceBundle().getResource("books")#
						</a>
					</li>
					<li>
						<a<cfif event.getRequestName() is "showPhotos"> id="selected"</cfif> href="index.cfm?#getProperty('eventParameter')#=showPhotos">
							#getProperty("resourceBundleService").getResourceBundle().getResource("photos")#
						</a>
					</li> --->
					<li <cfif event.getRequestName() is "board"> class="active"</cfif>>
						<a href="#BuildUrl('board')#">
							#getProperty("resourceBundleService").getResourceBundle().getResource("board")#
						</a>
					</li>
					<li <cfif event.getRequestName() is "contact"> class="active"</cfif>>
						<a href="#BuildUrl('contact')#">
							#getProperty("resourceBundleService").getResourceBundle().getResource("contact")#
						</a>
					</li>
					
			<li>		
			<cfif event.getArg("authType") is not "none">
				<a href="#BuildUrl('logout')#">#getProperty("resourceBundleService").getResourceBundle().getResource("logout")#</a>
			<cfelse>
				<a href="#BuildUrl('login')#">#getProperty("resourceBundleService").getResourceBundle().getResource("login")#</a>
			</cfif>
			</li>
				
			</ul>
		</div>
	</div>
	<cfif Len(getProperty("googleAnalyticsUAccount","")) GT 0>
		<script type="text/javascript">
		var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
		document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));
		</script>
		<script type="text/javascript">
		var pageTracker = _gat._getTracker("UA-3548918-3");
		pageTracker._trackPageview();
		</script>
	</cfif>
</body>
</cfoutput>
</html>
