


	const testKakao = () => {
		const xhr = new XMLHttpRequest()
		
		let query = document.getElementById('query').value
		let page = document.getElementById('pageno').value
		let size = document.getElementById('size').value
		let sort = document.getElementById('accuracy').checked
		if(sort)	//true 또는 false => boolean 타입
			sort = 'accuracy'
		else
			sort = 'recency'
		
		
		xhr.open('GET',
				`https://dapi.kakao.com/v2/search/vclip?query=${query}&sort=${sort}&page=${page}&size=${size}`)
		xhr.setRequestHeader('Authorization','KakaoAK a980cf72617a89eec4409ed602201d2e')
		xhr.send()
		
		let result = ''
		
		xhr.onload = function(){
			let $response
			if(xhr.status == 200) {
				alert('kakao 검색 응답을 받았습니다.')
				$response = JSON.parse(xhr.response)
				result = $response.documents
			}//if end
			
			//result를 화면에 목록으로 보여주기
			document.getElementById('list').innerHTML = ''	//★★★ 초기화 ★★★
			result.forEach((item) => {	//item 매개변수는 배열 요소를 순차적으로 저장. 함수 실행
				const $ul = document.createElement('ul')
				const temp = `
								<li>${item.author}</li>
								<li>${item.title}</li>
								<li>${item.play_time}</li>
								<li>${item.datetime}</li>
								<li>
									<a href=${item.url} target='_blank'>
										<img src=${item.thumbnail} width='200px'>
									</a>
								</li>
							`//◀ 백틱(`) 사용했음
				$ul.innerHTML = temp
				document.getElementById('list').appendChild($ul)
			})
			
			//총 검색건수 보여주기
			result = $response.meta
			
			document.getElementById('count').innerHTML = ''	//★★★ 초기화 ★★★
			document.getElementById('count').innerHTML = result.total_count.toLocaleString()
			
		}//xhr.onload function end
		
		//버튼 누르면 text 안의 내용 비우기
		document.getElementById('query').value = ''
		document.getElementById('pageno').value = ''
		document.getElementById('size').value = ''
		
	}//testKakao function end
	
	document.getElementById('searchBtn').addEventListener('click',testKakao)
		