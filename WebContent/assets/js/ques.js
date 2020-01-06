fetch("qapi").then( response => response.json() ).then( data => {
	
var all_html = "";

const ddd = data.questions;

ddd.map( i => {
	
all_html += 
	
`
<a href="sqapi?ques=${i.id}">
<div class="card">
<div class="meta">
<a href="#"><img class="userimg" src="./assets/icons/profile_1.png" alt=""/></a>
<a href="#" class="username">@${i.username}</a>
<p class="date">${i.iso_date_time}</p>
</div>
<div class="ques_meta">
<p class="ques">
${i.question}
<br />
</p>
<a href="sqapi?ques=${i.id}">
<div class="actions">
<img src="./assets/icons/comments.png" alt="" />
<p>X answers</p>
</div>
</a>
</div>
</div>
</a>`;

})
		document.getElementById("target").innerHTML = all_html + "";
});