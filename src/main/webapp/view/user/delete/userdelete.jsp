<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>userPasswdCheck</title>
</head>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<style>
label {
	color: #745d46;
}

.jumbotron {
	border: solid 10px #745d46;
	background-color: #fffff8;
}

body {
	color: #745d46;
}

b {
	color: #745d46
}
</style>
<body>
	<br>
	<p>
		<br>
	<div align="center">
		<div class="col-lg-5 jumbotron w3-panel w3-round-xlarge">
			<br>
			<p/>
				<br> <b><h3>탈퇴 안내</h3></b><br>
			<p>
			<p>
			<p>
				<b>회원탈퇴를 신청하기 전에 안내 사항을 꼭 확인해주세요.</b>
			</p>
			<p>
				<b>사용하고 계신 아이디는 탈퇴할 경우 복구가 불가하오니 신중하게 선택하시기 바랍니다.</b>
			</p>
			
			<br>
			
			<p>
				<b>탈퇴 후 회원정보 및 개인형 서비스 이용기록은 모두 삭제됩니다.</b>
				<br> 회원정보 및 쪽지 서비스 이용기록은 모두 삭제되며, 삭제된 데이터는 복구되지 않습니다.
				<br> 삭제되는 내용을 확인하시고 필요한 데이터는 미리 백업을 해주세요.<br>
			</p>
			
			<br>
			
			<p>
				<b>탈퇴 후에도 게시판형 서비스에 등록한 게시물은 그대로 남아 있습니다.</b>
				<br> 게시글 및 댓글은 탈퇴 시 자동 삭제되지 않고 그대로 남아 있습니다.
				<br> 삭제를 원하는 게시글이 있다면 반드시 탈퇴 전 삭제하시기 바랍니다.
				<br> 탈퇴 후에는 회원정보가 삭제되어 본인 여부를 확인할 수 있는 방법이 없어, 
				<br> 게시글을 임의로 삭제해드릴 수 없습니다.
			</p>


			<hr>

			<p>
				<b>탈퇴 후에는 아이디와 데이터는 복구할 수 없습니다.</b><br> 
				<b>또한, 게시판형 서비스에 남아 있는 게시글은 탈퇴 후 삭제할 수 없습니다.</b>
			</p>
			<br>
			<p>
				<b>안내 사항을 모두 확인하였으며, 이에 동의하신다면 비밀번호를 입력해주시기바랍니다.</b>
			</p>
			<div align="center">
				<br>				<p>					<br>
				<form method="post" action="userPasswdCheckPro">
					<label> 
						<input class="w3-input" type="password" name="userpasswd" placeholder="Password" size="30" />
					</label> 
						<input type="submit" class="w3-button w3-round-large" value="확인" style="background-color: #745d46; color:white;" />
				</form>
				<br> <br>	<p>
			</div>
		</div>
	</div>
	<br>
	<p>
		<br> <br>
	<p>
</body>
</html>