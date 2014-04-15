<!doctype html>
<!-- Conditional comment for mobile ie7 http://blogs.msdn.com/b/iemobile/ -->
<!--[if IEMobile 7 ]>    <html class="no-js iem7" manifest="files.appcache"> <![endif]-->
<!--[if (gt IEMobile 7)|!(IEMobile)]><!--> <html class="no-js" manifest="files.appcache"> <!--<![endif]-->

<head>
  <meta charset="utf-8">

  <title>iPlover</title>
  
  <!-- SAH: app description -->
  <meta name="description" content="HTML5 app for plover monitors to log nest site attributes in the field">
  <meta name="author" content="Rob Thieler, USGS, 99.6% based on work by Scott Haefner, USGS">

  <meta name="HandheldFriendly" content="True">
  <meta name="MobileOptimized" content="320">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <link rel="apple-touch-icon-precomposed" sizes="114x114" href="img/h/apple-touch-icon-precomposed.png">
  <link rel="apple-touch-icon-precomposed" sizes="72x72" href="img/m/apple-touch-icon-precomposed.png">
  <link rel="apple-touch-icon-precomposed" href="img/l/apple-touch-icon-precomposed.png">
  <link rel="shortcut icon" href="img/l/apple-touch-icon-precomposed.png">

  <meta name="apple-mobile-web-app-capable" content="yes" />
  <meta name="apple-mobile-web-app-status-bar-style" content="black">
  <!-- Prevent links in standalone web apps opening Mobile Safari -->
  <script>(function(a,b,c){if(c in b&&b[c]){var d,e=a.location,f=/^(a|html)$/i;a.addEventListener("click",function(a){d=a.target;while(!f.test(d.nodeName))d=d.parentNode;"href"in d&&(chref=d.href).replace(e.href,"").indexOf("#")&&(!/^[a-z\+\.\-]+:/i.test(chref)||chref.indexOf(e.protocol+"//"+e.host)===0)&&(a.preventDefault(),e.href=d.href)},!1)}})(document,window.navigator,"standalone");</script>
  <link rel="apple-touch-startup-image" href="img/l/splash.png">

  <meta http-equiv="cleartype" content="on">

  <link rel="stylesheet" href="css/base.css">
  <script src="js/libs/modernizr-custom.js"></script>
  <script>Modernizr.mq('(min-width:0)') || document.write('<script src="js/libs/respond.min.js">\x3C/script>')</script>
  
  <!-- SAH: disable format detection by default -->
  <meta name="format-detection" content="telephone=no"/> 
  <meta name="format-detection" content="address=no"/>
  
  <!-- SAH: iUI -->
  <link rel="stylesheet" href="iui/iui.css" type="text/css" />
  <link rel="stylesheet" href="iui/iui-panel-list.css" type="text/css" />
  <link rel="stylesheet" href="iui/t/default/default-theme.css" type="text/css" />
  <script type="application/x-javascript" src="iui/iui.js"></script>
  <script type="application/x-javascript" src="iui/ext-sandbox/jit-loader/jit-loader.js"></script>
  
  <!-- SAH: site CSS -->
  <link rel="stylesheet" href="css/style.css" type="text/css" />
</head>

<body>

  <div class="toolbar">
    <h1 id="pageTitle"></h1>
    <a id="backButton" class="button" href="#"></a>
  </div>

  <!-- Home -->
  
  <div id="home" class="panel" title="Home" selected="true">

    <!--<h2>Identify yourself</h2>
    <fieldset>
      <div class="row" id="user">
        <label for="operator">Observer</label>
        <input type="email" name="operator" id="operator" placeholder="Email address" autocapitalize="off" autocorrect="off" required="required">
      </div>
    </fieldset>-->

    <h2>Log a Nest Site</h2>            
    <ul>
      <li><a href="#newnestsite">New Nest Site</a></li>

    </ul>
    
    <h2>Upload</h2>
    <ul id="syncrecords">
      <li><a href="#sync">Upload Data</a></li>
    </ul>

    <div id="hidden-fields">
      <input type="hidden" name="client-version" id="client-version" value='TODO:fix this'>
      <input type="hidden" name="form-name" id="form-name">
      <input type="hidden" name="location-timestamp" id="timestamp">
      <input type="hidden" name="location-lat" id="lat">
      <input type="hidden" name="location-lon" id="lon">
      <input type="hidden" name="location-accuracy" id="accuracy">
      <input type="hidden" name="location-z" id="z">
      <input type="hidden" name="location-zaccuracy" id="zaccuracy">
    </div>
    
  </div>
  
  <!-- New Nest Site form -->

  <form id="newnestsite" title="New Nest Site" class="panel" target="_self" name="newnestsite" action="javascript:void(0);" onsubmit="return storeRecordImage()">
    <fieldset>
      <div class="row">
        <label for="newnestsite-site">Site</label>
        <input type="text" name="site" id="newnestsite-site" placeholder="site name" autocapitalize="off" autocorrect="off" required="required">
      </div>
	  <div class="row">
		<label for="newnestsite-picture">Picture</label>
		<input type="file" name="picture" id="newnestsite-picture" accept="image/*;capture=camera">
	  </div>
      <div class="row">
        <label for="newnestsite-location">Location</label>
        <input type="text" name="location" id="newnestsite-location">
      </div>

    </fieldset>
    <fieldset>
      <div class="row">
        <label>Geomorphic Setting</label>
        <ul class="inputs">
          <li><input type="radio" name="setting" id="newnestsite-setting-beach" value="beach"> <label for="newnestsite-setting-beach">Beach</label></li>
          <li><input type="radio" name="setting" id="newnestsite-setting-upperbeach" value="upperbeach"> <label for="newnestsite-setting-upperbeach">Upper Beach</label></li>
          <li><input type="radio" name="setting" id="newnestsite-setting-lowduneforedune" value="lowduneforedune"> <label for="newnestsite-setting-lowduneforedune">Low Dune / Foredune</label></li>
          <li><input type="radio" name="setting" id="newnestsite-setting-dune" value="dune"> <label for="newnestsite-setting-dune">Dune</label></li>
          <li><input type="radio" name="setting" id="newnestsite-setting-washover" value="washover"> <label for="newnestsite-setting-washover">Washover</label></li>
          <li><input type="radio" name="setting" id="newnestsite-setting-barrierinterior" value="barrierinterior"> <label for="newnestsite-setting-barrierinterior">Barrier Interior</label></li>
          <li><input type="radio" name="setting" id="newnestsite-setting-blowout" value="blowout"> <label for="newnestsite-setting-blowout">Dune Blowout</label></li>
          <li><input type="radio" name="setting" id="newnestsite-setting-ridgeswale" value="ridgeswale"> <label for="newnestsite-setting-ridgeswale">Beach Ridge / Swale</label></li>
        </ul>
      </div>
      <div class="row">
        <label>Vegetation Cover</label>
        <ul class="inputs">
          <li><input type="radio" name="vegcover" id="newnestsite-vegcover-none" value="none"> <label for="newnestsite-vegcover-none">None</label></li>
          <li><input type="radio" name="vegcover" id="newnestsite-vegcover-sparse" value="sparse"> <label for="newnestsite-vegcover-sparse">Sparse</label></li>
          <li><input type="radio" name="vegcover" id="newnestsite-vegcover-moderate" value="moderate"> <label for="newnestsite-vegcover-moderate">Moderate</label></li>
          <li><input type="radio" name="vegcover" id="newnestsite-vegcover-dense" value="dense"> <label for="newnestsite-vegcover-dense">Dense</label></li>
        </ul>
      </div>
     </fieldset>
    <h2>Distances</h2>
    <fieldset>
      <div class="row">
        <label for="newnestsite-toMOSH">To MOSH</label>
        <input type="number" name="toMOSH" id="newnestsite-toMOSH" placeholder="meters">
      </div>
      <div class="row">
        <label for="newnestsite-toHighTideLine">To OHTL</label>
        <input type="number" name="toHighTideLine" id="newnestsite-toHighTideLine" placeholder="meters">
      </div>
    </fieldset>
    <fieldset>
      <div class="row">
        <label for="newnestsite-notes">Notes</label>
        <textarea rows="3" name="notes" id="newnestsite-notes"></textarea>
      </div>
    </fieldset>
    <a class="whiteButton record" type="submit" href="#">Save Nest Data</a>
  </form>
  
  <!-- Sync Records -->
  
  <div id="sync" title="Upload Data" class="panel">
    <p>
    	Sites that you save are stored on your device.<br/><br/>
    	You current have <span id="syncnumsites">0</span> sites stored. To upload them to the USGS data repository, tap the button below.<br/><br/>
    </p>
    <ul id="syncstatus">
      <li class="success"></li>
      <li class="error"></li>
    </ul>
    <a class="whiteButton" id="syncbutton" target="_blank" href="#">Upload Sites</a>
  </div>

  <script src="//ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
  <script>window.jQuery || document.write('<script src="js/libs/jquery-1.6.2.min.js"><\/script>')</script>

  <!-- scripts concatenated and minified via ant build script -->
  <script src="js/mylibs/helper.js"></script>
  <!-- end concatenated and minified scripts-->
  
  <script type="application/x-javascript" src="js/onload.js"></script>
  <script type="application/x-javascript" src="js/plugins.js"></script>
  <script type="application/x-javascript" src="js/script.js"></script>

  <script>
    MBP.scaleFix();
  </script>

  <script>
    var _gaq=[["_setAccount","UA-XXXXX-X"],["_trackPageview"]];
    (function(d,t){var g=d.createElement(t),s=d.getElementsByTagName(t)[0];g.async=1;
    g.src=("https:"==location.protocol?"//ssl":"//www")+".google-analytics.com/ga.js";
    //s.parentNode.insertBefore(g,s)
    }(document,"script"));
  </script>

</body>
</html>
