<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>コミック追加</title>
</head>
<body>
	<form action="/Comic_DB/Addcomic" method="post">
		<table>
			<tr>
				<td>タイトル：</td>
				<td><input type=text name=title></td>
			</tr>
			<tr>
				<td>フリガナ：</td>
				<td><input type=text name=phonetic></td>
			</tr>
			<tr>
				<td>作者：</td>
				<td><input type=text name=author></td>
			</tr>
			<tr>
				<td>出版社</td>
				<td><select name="publisher">
						<option value="集英社">集英社</option>
						<option value="講談社">講談社</option>
						<option value="小学館">小学館</option>
						<option value="秋田書店">秋田書店</option>
						<option value="スクエアエニックス">スクエアエニックス</option>
						<option value="白泉">白泉</option>
						<option value="竹書房">竹書房</option>
						<option value="日本文芸社">日本文芸社</option>
						<option value="その他">その他</option>
				</select></td>
			</tr>
			<tr>
				<td>最新刊</td>
				<td><input type="number" name=latest min=1></td>
			</tr>
			<tr>
				<td>場所</td>
				<td><input type="number" name=shelf min=1 max=88></td>
			</tr>
			<tr>
				<td>完結</td>
				<td><select name="completed">
						<option value="" selected>未完</option>
						<option value="完">完</option>
				</select></td>
			</tr>
			<tr>
				<td></td>
				<td><input type="submit" value="送信"><input type="reset"></td>
			</tr>
		</table>
	</form>
</body>
</html>