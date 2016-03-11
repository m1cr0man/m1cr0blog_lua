			<div class="pure-u-1-2 padded centered">
				<?lua if err then ?>
				<h1><%= err %></h1>
				<?lua end ?>
				<form class="pure-form" method="POST" action="/admin/login">
					<fieldset>
						<legend><h1>Login</h1></legend>
						<input type="text" name="username" placeholder="username" min="3" max="255">
						<br />
						<br />
						<input type="password" name="password" placeholder="password" min="3" max="255">
						<br />
						<br />
						<button type="submit" class="pure-button pure-button-primary">Sign in</button>
					</fieldset>
				</form>
			</div>
