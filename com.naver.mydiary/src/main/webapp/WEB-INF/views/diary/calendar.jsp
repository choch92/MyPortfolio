<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>

<style>
#red {
	color: #EC0909;
}
</style>

<div class="container-wrap" align="center">
	<div class="my-calendar clearfix" style="background:papayawhip;">
		<div class="clicked-date" >
			<div class="cal-day"></div>
			<div id="todolist"></div>
		</div><br/>
		<div class="calendar-box" >
			<div class="ctr-box clearfix">
				<button type="button" title="prev" class="btn-cal prev"></button>
				<span class="cal-month"></span> <span class="cal-year"></span>
				<button type="button" title="next" class="btn-cal next"></button>
			</div>
			<table class="cal-table" align="center" >
				<thead>
					<tr>
						<th align="center" id="red">Sun</th>
						<th align="center">Mon</th>
						<th align="center">Tue</th>
						<th align="center">Wed</th>
						<th align="center">Thu</th>
						<th align="center">Fri</th>
						<th align="center">Sat</th>
					</tr>
				</thead>
				<tbody class="cal-body"></tbody>
			</table>
		</div>
	</div>
	<input type="button" value="Home" class="btn btn-success btn-lg" onclick="javascript:window.location='/'"/>
</div>

<%@ include file="../include/footer.jsp"%>

<script>

// 달력 초기 설정 시작
const init = {
   
   // 월 배열 데이터 설정
   monList: ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'],
   // 일 배열 데이터 설정
   dayList: ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'],
   // 오늘 날짜 담기
   today: new Date(),
   
   monForChange: new Date().getMonth(),
   activeDate: new Date(),
   // mm 값은 new Date.getMonth() 한 값으로 '해당 월 - 1' 임.
   // 어떤 달의 첫번재 날에 대한 정보를 얻기위한 설정
   getFirstDay: (yy, mm) => new Date(yy, mm, 1),
   // 어떤 달의 마지막 날에 대한 정보를 얻기위한 설정
   getLastDay: (yy, mm) => new Date(yy, mm + 1, 0),
   
   // 다음 버튼을 클릭하면 객체의 nextMonth 함수 실행
   // 지금 해당하는 달을 1증가, 그 숫자를 새로 가져온 날짜 객체 d에 d.setMonth()로 설정
   // 이 때, d.setDate(1)로 일자를 1일로 세팅해주는데, 그 이유는 만약에 내가 5월 31일에 nextMonth 함수를 실행시켜 달만 6월로 바꿔줄 경우
   // 6월에는 30일가지 밖에 없으므로 자동으로 7월 1일로 변경될 수 있기 때문임
   nextMonth: function () {
      let d = new Date();
      d.setDate(1);
      d.setMonth(++this.monForChange);
      this.activeDate = d;
      return d;
   },
   // 이전 달 버튼 클릭 메소드
   prevMonth: function () {
      let d = new Date();
      d.setDate(1);
      d.setMonth(--this.monForChange);
      this.activeDate = d;
      return d;
   },
   addZero: (num) => (num < 10) ? '0' + num : num,
   activeDTag: null,
   getIndex: function (node) {
      let index = 0;
      while (node = node.previousElementSibling) {
         index++;
      }
      return index;
   }
};

const $calBody = document.querySelector('.cal-body');
const $btnNext = document.querySelector('.btn-cal.next');
const $btnPrev = document.querySelector('.btn-cal.prev');

/**
* @param {number} date
* @param {number} dayIn
*/
function loadDate (date, dayIn) {
   //document.querySelector('.cal-date').textContent = date;
   document.querySelector('.cal-day').textContent = init.dayList[dayIn];
}

/**
* @param {date} fullDate
*/

// 달력의 일자 부분을 출력하는 함수
// 처음 캘린더를 로드할 때, 달력의 이전, 다음 버튼을 클릭할 때 함수를 실행
function loadYYMM (fullDate) {
   
   let yy = fullDate.getFullYear();
   let mm = fullDate.getMonth();
   let firstDay = init.getFirstDay(yy, mm);
   let lastDay = init.getLastDay(yy, mm);
   let markToday; // for marking today date
   if (mm === init.today.getMonth() && yy === init.today.getFullYear()) {
      markToday = init.today.getDate();
   }
   document.querySelector('.cal-month').textContent = init.monList[mm];
   document.querySelector('.cal-year').textContent = yy;
   let trtd = '';
   let startCount = 0;
   let countDay = 0;
   
   for (let i = 0; i < 6; i++) {
      trtd += '<tr>';
      
      for(let j=0; j<7; j++){
         // 날짜가 처음 시작하면 startCount 변수를 0에서 1로 변경
         // 만약에 표시할 달력의 년도/월이 오늘 날짜의 년도/월과 일치하면 markToday 변수에 오늘 날짜의 일자를 할당한 후
         // countDay 변수가 markToday 값과 일치하면 td에 today 클래스를 준다.
         if (i === 0 && !startCount && j === firstDay.getDay()) {
            startCount = 1;
         }
         if (!startCount) {
            trtd += '<td>'
         }
         
         else {
            let fullDate = yy + '.' + init.addZero(mm + 1) + '.' + init.addZero(countDay + 1);
            //날짜 하나하나를 생성
            trtd += '<td onClick="go('+yy+','+mm+','+countDay+')" class="day';
            trtd += (markToday && markToday === countDay + 1) ? ' today" ' : '"';
            trtd += ` data-date="${countDay + 1}" data-fdate="${fullDate}">`;
         }
         trtd += (startCount) ? ++countDay : '';
         
         // 날짜 세는 것이 끝나면 startCount 변수를 다시 0으로 초기화
         if (countDay === lastDay.getDate()) {
            startCount = 0;
         }
         trtd += '</td>';
      }
      trtd += '</tr>';
   }
   $calBody.innerHTML = trtd;
}

/**
* @param {string} val
*/


   loadYYMM(init.today);
   loadDate(init.today.getDate(), init.today.getDay());

   $btnNext.addEventListener('click', () => loadYYMM(init.nextMonth()));
   $btnPrev.addEventListener('click', () => loadYYMM(init.prevMonth()));

   $calBody.addEventListener('click', (e) => {
   if (e.target.classList.contains('day')) {
       if (init.activeDTag) {
            init.activeDTag.classList.remove('day-active');
       }
       let day = Number(e.target.textContent);
      loadDate(day, e.target.cellIndex);
       e.target.classList.add('day-active');
       init.activeDTag = e.target;
       init.activeDate.setDate(day);
       //reloadTodo();
   }
   });
</script>

<script>
//해당일의 할 일을 옆에 표시
function go(yy,mm,countDay){
   var m = mm+1;
   if(m < 10){
      m = "0" + m;
   }
   var day = countDay+1;
   if(day < 10){
      day = "0" + day;
   }
   var startDate = yy + "-" + m + "-" + day;
   
   document.getElementById("todolist").innerHTML=startDate+"<br/><br/>";
   
   //ajax로 요청보내기
   var request=new XMLHttpRequest();
   request.open('POST','/diary/calendar/'+startDate);
   request.send('');
   
   request.onreadystatechange=function(){
      //정상응답이 오면
      if(request.readyState==4){
         if(request.status>=200 && request.status<300){
            //결과 받고
            var obj=request.responseText;
            var json=JSON.parse(obj);
            
            if(json==""){
               document.getElementById("todolist").innerHTML+="일정을 추가하세요."+"<br/>";
               document.getElementById("todolist").innerHTML+="<input type='button' value='일정추가' class='btn btn-success-xs' onClick='todoinsert()'"+"<br/>";
               document.getElementById("todolist").innerHTML+="<input type='button' value='일정목록' class='btn btn-primary-xs' onClick='todolist("+yy+','+m+','+day+")'"+"<br/>";
               return;
            }
          
            //각 배열에 각각 category, startDate의 시간을 저장
            var cate=new Array();   //category 저장
            var da=new Array();      //startDate 저장
            
            for(var v in json){
               cate[v]=json[v].category;
               da[v]=json[v].startDate.substring(11,16);
            }
            
            //출력할 내용 만들기
            //기본적으로 선택한 날짜 나오고
            var out=startDate+"<br/>";
            //out+="${user.email}";
            //cate에 저장되어 있는 내용에 따라서 아이콘과 내용 추가
            
            for(var v in cate){
               if(cate[v]=="date"){
                  out+="<i class='fas fa-heart'></i>";
                  out+="&nbsp;"+da[v]+"<br/>";
               }else if(cate[v]=="anniversary"){
                  out+="<i class='fas fa-calendar-alt'></i>";
                  out+="&nbsp;"+da[v]+"<br/>";
               }else if(cate[v]=="friend"){
                  out+="<i class='fas fa-user'></i>";
                  out+="&nbsp;"+da[v]+"<br/>";
               }else if(cate[v]=="company"){
                  out+="<i class='fas fa-home'></i>";
                  out+="&nbsp;"+da[v]+"<br/>";
               }else if(cate[v]=="hobby"){
                  out+="<i class='fas fa-poo'></i>";
                  out+="&nbsp;"+da[v]+"<br/>";
               }else if(cate[v]=="etc"){
                  out+=" <i class='fas fa-cogs'></i>";
                  out+="&nbsp;"+da[v]+"<br/>";
               }
               //버튼 추가
            }
            
            out+="<br/><input type='button' value='일정추가' class='btn btn-xs' onClick='todoinsert()'"+"<br/>&nbsp;&nbsp;";
            out+="<input type='button' value='일정목록' class='btn btn-xs' onClick='todolist("+yy+','+m+','+day+")'"+"<br/>";
            document.getElementById("todolist").innerHTML=out;
         }
      }
   }
}
</script>

<script>
function calendarlist(){
	location.href="/diary/calendar/"+sDay;
}
</script>

<script>
//일정추가 버튼 누르면 일정추가 페이지로 이동하는 todoinsert() 함수 생성
function todoinsert(){
   console.log();
   location.href="/diary/todoinsert";
}
</script>

<script>
//자세히 버튼을 누르면 수행할 함수
function todolist(yy,mm,countDay){
	var m = mm;
	if(m < 10){
	   m = "0" + m;
	}
	var day = countDay;
	if(day < 10){
	   day = "0" + day;
	}

   var sDay = yy + "-" + (m) + "-" + (day);
   console.log(sDay);
   location.href="/diary/todolist/"+sDay;
   //location.href="/diary/list";
}
</script>