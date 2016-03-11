<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta name="description" content="The blog of a human">
		<meta name="author" content="Lucas Savva">
		<link rel="shortcut icon" href="../../docs-assets/ico/favicon.png">

		<title><%=page.title%></title>

		<!-- Pure CSS -->
		<link href="<%=page.theme_path%>/css/pure.min.css" rel="stylesheet">

		<!-- Custom CSS -->
		<link href="<%=page.theme_path%>/css/custom.css" rel="stylesheet">

		<!-- Favicon -->
		<link href="<%=page.theme_path%>/images/favicon.ico?v=057651f691c119d4501eaabc3de181e1" rel="shortcut icon">

		<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
		<!--[if lt IE 9]>
			<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
			<script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
		<![endif]-->
	</head>

	<body>

		<!-- Nav Bar -->
		<div id="header" class="pure-menu pure-menu-horizontal">
			<a href="/" id="logo" class="pure-menu-heading pure-menu-link"><img style="height: 80px;" src="<%=page.theme_path%>/images/m1cr0man.png" alt="M1cr0man Logo"></a>
			<ul class="pure-menu-list">
				<li class="pure-menu-item"><a href="/downloads" class="pure-menu-link">Downloads</a></li>
				<li class="pure-menu-item"><a href="/gallery" class="pure-menu-link">Gallery</a></li>
				<li class="pure-menu-item"><a href="/projects" class="pure-menu-link">Projects</a></li>
			</ul>
		</div>

		<!-- Begin page content -->
{{content}}

		<div id="footer" class="pure-u-1-1">
			<p class="text-muted">© 2016 Lucas Savva. Proudly powered by <a href="http://sailorproject.org" target="_blank">Sailor MVC</a>, <a href="http://lua.org" target="_blank">Lua</a> and <a href="http://purecss.io" target="_blank">PureCSS</a></p>
		</div>

		<!-- Bootstrap core JavaScript
		================================================== -->
		<!-- Placed at the end of the document so the pages load faster -->
		<!--<script src="<%=page.theme_path%>/js/jquery-1.10.2.min.js"></script> -->
	</body>
</html>
