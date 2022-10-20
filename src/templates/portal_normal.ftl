<#include init />

<#assign txtDrugs="Rek. läkemedel" />
<#assign txtAdvice="Terapiråd" />
<#assign txtResources="Övrigt" />
<#assign txtNews="Nyheter" />

<#assign txtFeedback="Tyck till" />
<#assign txtFeedbackURL="#/resource/Tyck_till_om_digitala_REKlistan" />

<!DOCTYPE html>

<html manifest="/o/reklistan-theme/resources/reklistan.appcache">

<head>
	<title>${the_title}</title>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="description" content="">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
	<link href="${themeDisplay.pathThemeRoot}/images/favicon.ico" rel="Shortcut Icon">
	<link href='https://fonts.googleapis.com/css?family=Roboto:500,900italic,900,400italic,100,700italic,300,700,500italic,100italic,300italic,400' rel='stylesheet' type='text/css'>
	<link href="https://fonts.googleapis.com/css?family=Material+Icons|Material+Icons+Outlined" rel="stylesheet">
	<#--
    <link class="lfr-css-file" href="${themeDisplay.pathThemeRoot}/css/main.css?browserId=${browserId}&themeId=${themeDisplay.themeId}&languageId=${themeDisplay.languageId}xx&b=${liferayBuild}&t=2" rel="stylesheet" type="text/css">
    -->
	<link class="lfr-css-file" data-senna-track="temporary" href="${css_main_file}" rel="stylesheet" type="text/css" />
	<script src="${themeDisplay.pathThemeRoot}/js/libs.min.js?t=1" type="text/javascript"></script>
    <script src="${themeDisplay.pathThemeRoot}/js/lunr.unicodeNormalizer.js?t=1" type="text/javascript"></script>
	<#--<script src="${themeDisplay.pathThemeRoot}/js/main.js?browserId=${browserId}&languageId=${themeDisplay.languageId}&b=${liferayBuild}&t=${.now?datetime?iso_local}" type="text/javascript"></script>-->
</head>

<body class="${css_class}">

<script>
	window.isSignedIn = ${currentUserSignedIn?string};
    window.authToken = "${authToken}";

</script>

<#-- HBS SEARCH RESULTS -->
<script id="search-results-template" type="text/x-handlebars-template">
	<div class="search-results-container">
		{{#each this}}
			<a href="#/{{link}}" class="list-item js-search-results-item item-{{@index}}">

				{{#is type 'drugs'}}
					<div class="list-item-icon">
						<span class="icomoon-drug icomoon-list-icon icon-15x"></span>
					</div>
				{{/is}}

				<div class="list-item-text">
					{{section}} <span class="search-chapter">({{chapter}})</span>
				</div>

			</a>
		{{/each}}
	  {{#unless this}}
	  <div class="list-item item-0">
  		<div class="list-item-text search-no-mathes-text">
  			Din sökning matchade inga dokument
  		</div>
	  </div>
	  {{/unless}}
	</div>
</script>

<#-- HBS MAIN MENU -->
<script id="main-menu-template" type="text/x-handlebars-template">
	<div class="search-wrapper view-topper">
		<div class="second-bar">
			<div class="search-input-container js-search-input-container on">
				<input type="text" class="search-input js-search-input" placeholder="Sök" autocorrect="off">
				<a href="#" class="search-clear js-search-clear">Rensa <i class="flaticon-close47"></i></a>
			</div>

			<div class="search-results-heading jq-search-results-heading">
				<div class="tabs tabs">
					<a href="#" class="tab single">Sökresultat</a>
				</div>
			</div>
		</div>
	</div>
	<div id="search-results-placeholder"></div>
	<div class="main-menu-logo">
		<img src="${images_folder}/theme/vgr-w400-c.png">
	</div>
	{{#if news}}
		<div class="main-menu-news-container js-main-menu-news-container lt-medium">
			<div class="list-item list-item-heading">
				<div class="list-item-text">
					${txtNews}
				</div>
			</div>
			{{#each news}}
				{{#if externallink}}
					<a href="{{externallink}}" target="_blank" class="list-item item-{{@index}}">
					<div class="list-item-icon">
						<i class="flaticon-external1"></i>
					</div>
				{{/if}}
				{{#unless externallink}}
					<a href="#/news/{{id}}" class="list-item item-{{@index}}">
				{{/unless}}
				<div class="list-item-text">
					{{title}}
				</div>
				</a>
			{{/each}}
		</div>
	{{/if}}
	<div class="mainmenu-area-items">
		<div class="list-item list-item-heading lt-medium">
			<div class="list-item-text">
				Områden
			</div>
		</div>
		<nav class="toggle-menu">
			<ul class="toggle-menu-list">
				{{#each areas}}
					<li class="{{#if subChapters}}open{{/if}} {{get-chapter-selected-css-class this}}">
						<div class="toggle-menu-item-main">
							<a href="#/{{#isnt hasDrugs true}}advice{{/isnt}}{{#is hasDrugs true}}drugs{{/is}}/{{urlencode _title}}" class="js-mainmenu-item item-{{@index}}">
								<span class="material-icons material-icons-outlined">arrow_right</span>
								<span>{{_title}}</span>
							</a>
							<button class="toggle-submenu-button"data-chapter="{{urlencode _title}}" data-tab="{{#isnt hasDrugs true}}advice{{/isnt}}{{#is hasDrugs true}}drugs{{/is}}">
								{{#if subChapters}}
									<span class="material-icons icon-remove">remove</span>
								{{/if}}
								{{#unless subChapters}}
									<span class="material-icons icon-add">add</span>
								{{/unless}}
							 </button>
						</div>
						<#-- Submenu -->
						<ul class="toggle-menu-list">
							{{#each subChapters.fields}}
								<li class="{{get-details-selected-css-class this}}">
									{{#if (findLinkToArticle children) }}
										<a href="{{findLinkToArticle children}}" class="submenu-item item-{{@index}} js-submenu-item" >
									{{else}}
										<a href="#/{{../../subChapters.tab}}/{{urlencode ../../subChapters.title}}/{{urlencode value}}" class="submenu-item item-{{@index}} js-submenu-item">
									{{/if}}
										<span class="material-icons material-icons-outlined">arrow_right</span>
										<span>{{value}}</span>
									</a>
								</li>
							{{/each}}
						</ul>
					</li>
				{{/each}}
			</ul>
		</nav>
	</div>
</script>

<#-- HBS NEWS -->
<script id="news-template" type="text/x-handlebars-template">
	{{#each this}}
		<div class="view-topper">
			<div class="second-bar">
				<h2 class="second-bar-title">{{title}}</h2>
			</div>
		</div>
		<div class="section-details">
			{{{body}}}
		</div>
	{{/each}}
</script>


<#-- HBS FILLER -->
<script id="filler-template" type="text/x-handlebars-template">
	<div class="details-inner">
		<div class="vgr-logo">
			<img src="${images_folder}/theme/vgr-w400-c.png">
		</div>
		{{#if news}}
			<div class="link-list">
				<h2>${txtNews}</h2>
				<ul>
					{{#each news}}
						{{#if externallink}}
							<li><a href="{{externallink}}" target="_blank"><i class="flaticon-external1"></i> {{title}}</a></li>
						{{/if}}
						{{#unless externallink}}
							<li><a href="#/news/{{id}}"><i class="flaticon-keyboard53"></i> {{title}}</a></li>
						{{/unless}}
					{{/each}}
				</ul>

			</div>
		{{/if}}
		{{#if resources}}
			<div class="link-list">
				<h2>${txtResources}</h2>
				<ul>
					{{#each resources}}
						{{#if externallink}}
							<li><a href="{{externallink}}" target="_blank"><i class="flaticon-external1"></i> {{title}}</a></li>
						{{/if}}
						{{#unless externallink}}
							<li><a href="#/resource/{{urlencode title}}"><i class="flaticon-keyboard53"></i> {{title}}</a></li>
						{{/unless}}
					{{/each}}
				</ul>
			</div>
		{{/if}}

	</div>
</script>


<#-- HBS FLY OUT MENU -->
<script id="fly-menu-template" type="text/x-handlebars-template">
	<div class="fly-menu-wrapper">
		<div class="fly-menu">
			{{#each resources}}
				{{#if externallink}}
					<a href="{{externallink}}" target="_blank" class="list-item js-fly-menu-link">
						<div class="list-item-icon">
							<i class="flaticon-external1 icon-15x"></i>
						</div>
						<div class="list-item-text">{{title}}</div>
					</a>
				{{/if}}
				{{#unless externallink}}
					<a href="#/resource/{{urlencode title}}" class="list-item js-fly-menu-link">
						<div class="list-item-text">{{title}}</div>
					</a>
				{{/unless}}
			{{/each}}
		</div>
	</div>
</script>

<#-- HBS FLY OUT MENU -->
<script id="admin-bar-template" type="text/x-handlebars-template">
	<div class="admin-bar admin-bar-{{#is present show}}same-year{{else}}other-year{{/is}}">
		<div>
			Visar utgåva
			<select class="js-year-selector">
				{{#each unique}}
					<option value="{{this}}" {{#is @root/show this}}selected{{/is}}>{{this}}</option>
				{{/each}}
			</select>
			<div class="admin-bar-meta">Du ser det här för att du är inloggad. <a href="/#/refresh">Ladda om artiklar</a>. Redigera artiklar i <a href="/admin">administrationsgränssnittet</a>.</div>
		</div>
	</div>
</script>


<#-- HTML -->
<div id="admin-bar-placeholder"></div>

<div id="app-wrapper">
	<div class="blurrer js-menu-blurrer"></div>

	<div class="loading-indicator js-loading-indicator">
		<div class="loading-indicator-inner">
			<div class="spinner"></div>
			<div class="spinner-text">Ett ögonblick, laddar all data</div>
		</div>
	</div>

	<div id="fly-menu-placeholder"></div>
	<div id="topbar">
		<div class="appbar">
			<div class="appbar-menu-title-wrapper">
                <div class="appbar-menu-title">
                    <a href="#">REK<span class="thin">listan <span id="revisionPlaceholder"></span></span></a>
                    <div class="appbar-menu-sub-title">Läkemedelskommittén i Västra Götalandsregionen</div>
                </div>
            </div>

            <div class="appbar-menu-sink-wrapper js-appbar-menu-sink-toggle">
				<div class="appbar-menu-sink-button">
					<span class="flaticon-menu55 icon-4x"></span>
				</div>
			</div>
			<a class="appbar-menu-back-wrapper js-navigation-button">
				<div class="appbar-menu-back-button">
					<i class="flaticon-left216 icon-4x"></i>
			    </div>
		    	<div class="appbar-menu-back-label mt-small">Tillbaka</div>
			</a>
		</div>
	</div>
	<div class="app-body">
		<div id="mainmenu" class="screen active">
			<div id="main-menu-placeholder"></div>
		</div>
		<div id="submenu-drugs" class="screen">
			<div id="submenu-drugs-placeholder" class="submenu"></div>
		</div>
		<div id="submenu-advice" class="screen">
			<div id="submenu-advice-placeholder" class="submenu"></div>
		</div>
		<div id="details-drugs" class="screen">
			<div id="details-drugs-placeholder" class="section"></div>
		</div>
		<div id="details-advice" class="screen">
			<div id="details-advice-placeholder" class="section"></div>
		</div>
		<div id="details-generic" class="screen">
			<div id="details-generic-placeholder"></div>
		</div>
		<div id="details-filler" class="screen">
			<div id="details-filler-placeholder"></div>
		</div>
	</div>
</div>

<script src="${themeDisplay.pathThemeRoot}/js/main.js?browserId=${browserId}&languageId=${themeDisplay.languageId}&b=${liferayBuild}&t=171" type="text/javascript"></script>

<script>
    initApp();
</script>

<script type="text/javascript">
  var _paq = _paq || [];
  _paq.push(['trackPageView']);
  _paq.push(['enableLinkTracking']);
  (function() {
    var u="//piwik.vgregion.se/";
    _paq.push(['setTrackerUrl', u+'piwik.php']);
    _paq.push(['setSiteId', 162]);
    var d=document, g=d.createElement('script'), s=d.getElementsByTagName('script')[0];
    g.type='text/javascript'; g.async=true; g.defer=true; g.src=u+'piwik.js'; s.parentNode.insertBefore(g,s);
  })();
</script>
<noscript><p><img src="//piwik.vgregion.se/piwik.php?idsite=162" style="border:0;" alt="" /></p></noscript>



		<#-- TODO, does this need to be here?
		<div class="temp-hide">
		${portletDisplay.recycle()}
		${portletDisplay.setTitle(the_title)}
		${theme.wrapPortlet("portlet.ftl", content_include)}
		</div> -->

</body>

</html>
