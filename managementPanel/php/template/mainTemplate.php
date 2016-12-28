<html>
<head>
	<title>iFlat Management Panel - Main Page</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<link rel="stylesheet" href="css/mainStyle.css">


</head>
<body>

<div class="flex-container">
<header>
  <h1>iFlat Management Panel</h1>
</header>

<nav class="nav">
	<strong>Menu</strong>
	<hr>
<ul>
  <li><a href="#">Issue Management</a></li>
  <li><a href="#">User Management</a></li>
  <li><a href="#">Flat Management</a></li>
</ul>
<hr>
<div class="quickstart-user-details-container">
	Firebase sign-in status: <span id="quickstart-sign-in-status">Unknown</span>
	<div>Firebase auth <code>currentUser</code> object value:</div>
	<pre><code id="quickstart-account-details">null</code></pre>
</div>
<button class="mdl-button mdl-js-button mdl-button--raised" id="quickstart-sign-in" name="signin">Sign In</button>
</nav>

<article class="article">
  <h1>Issue Management</h1>
  <p><strong>Closing issue</strong></p>
</article>

<footer>iFlat</footer>
</div>

</body>
</html>
