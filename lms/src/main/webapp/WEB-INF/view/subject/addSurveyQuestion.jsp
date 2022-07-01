<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html :class="{ 'theme-dark': dark }" x-data="data()" lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>addSurveyQuestion</title>
<script src="/js/summernote/summernote-lite.js"></script>
<script src="/js/summernote/lang/summernote-ko-KR.js"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<link rel="stylesheet" href="/css/summernote/summernote-lite.css">
<link
	href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap"
	rel="stylesheet" />
<link rel="stylesheet" href="./public/assets/css/tailwind.output.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/gh/alpinejs/alpine@v2.x.x/dist/alpine.min.js"
	defer></script>
<script src="./public/assets/js/init-alpine.js"></script>
</head>
<body>
	<div class="flex h-screen bg-gray-50 dark:bg-gray-900"
		:class="{ 'overflow-hidden': isSideMenuOpen}">
		<aside
			class="z-20 flex-shrink-0 hidden w-64 overflow-y-auto bg-white dark:bg-gray-800 md:block">
			<div class="py-4 text-gray-500 dark:text-gray-400">
				<a class="ml-6 text-lg font-bold text-gray-800 dark:text-gray-200"
					href="${pageContext.request.contextPath}/memberIndex"> LMS </a>
				<ul class="mt-6">
					<li class="relative px-6 py-3"><a
						class="inline-flex items-center w-full text-sm font-semibold transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200"
						href="${pageContext.request.contextPath}/memberIndex"> <svg
								class="w-5 h-5" aria-hidden="true" fill="none"
								stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
								viewBox="0 0 24 24" stroke="currentColor">
                  <path
									d="M3 12l2-2m0 0l7-7 7 7M5 10v10a1 1 0 001 1h3m10-11l2 2m-2-2v10a1 1 0 01-1 1h-3m-6 0a1 1 0 001-1v-4a1 1 0 011-1h2a1 1 0 011 1v4a1 1 0 001 1m-6 0h6"></path>
                </svg> <span class="ml-4">수강중인 강좌리스트</span>
					</a></li>
				</ul>
				<ul>
					<li class="relative px-6 py-3"><a
						class="inline-flex items-center w-full text-sm font-semibold transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200"
						href="forms.html"> <svg class="w-5 h-5" aria-hidden="true"
								fill="none" stroke-linecap="round" stroke-linejoin="round"
								stroke-width="2" viewBox="0 0 24 24" stroke="currentColor">
                  <path
									d="M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2m-3 7h3m-3 4h3m-6-4h.01M9 16h.01"></path>
                </svg> <span class="ml-4">내 정보수정</span>
					</a></li>
					<li class="relative px-6 py-3"><a
						class="inline-flex items-center w-full text-sm font-semibold transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200"
						href="cards.html"> <svg class="w-5 h-5" aria-hidden="true"
								fill="none" stroke-linecap="round" stroke-linejoin="round"
								stroke-width="2" viewBox="0 0 24 24" stroke="currentColor">
                  <path
									d="M19 11H5m14 0a2 2 0 012 2v6a2 2 0 01-2 2H5a2 2 0 01-2-2v-6a2 2 0 012-2m14 0V9a2 2 0 00-2-2M5 11V9a2 2 0 012-2m0 0V5a2 2 0 012-2h6a2 2 0 012 2v2M7 7h10"></path>
                </svg> <span class="ml-4">내가 쓴 건의함</span>
					</a></li>
					<li class="relative px-6 py-3"><a
						class="inline-flex items-center w-full text-sm font-semibold transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200"
						href="charts.html"> <svg class="w-5 h-5" aria-hidden="true"
								fill="none" stroke-linecap="round" stroke-linejoin="round"
								stroke-width="2" viewBox="0 0 24 24" stroke="currentColor">
                  <path
									d="M11 3.055A9.001 9.001 0 1020.945 13H11V3.055z"></path>
                  <path d="M20.488 9H15V3.512A9.025 9.025 0 0120.488 9z"></path>
                </svg> <span class="ml-4">내가 쓴 자유게시판</span>
					</a></li>
					<li class="relative px-6 py-3"><a
						class="inline-flex items-center w-full text-sm font-semibold transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200"
						href="buttons.html"> <svg class="w-5 h-5" aria-hidden="true"
								fill="none" stroke-linecap="round" stroke-linejoin="round"
								stroke-width="2" viewBox="0 0 24 24" stroke="currentColor">
                  <path
									d="M15 15l-2 5L9 9l11 4-5 2zm0 0l5 5M7.188 2.239l.777 2.897M5.136 7.965l-2.898-.777M13.95 4.05l-2.122 2.122m-5.657 5.656l-2.12 2.122"></path>
                </svg> <span class="ml-4">Buttons</span>
					</a></li>
					<li class="relative px-6 py-3"><a
						class="inline-flex items-center w-full text-sm font-semibold transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200"
						href="modals.html"> <svg class="w-5 h-5" aria-hidden="true"
								fill="none" stroke-linecap="round" stroke-linejoin="round"
								stroke-width="2" viewBox="0 0 24 24" stroke="currentColor">
                  <path
									d="M8 16H6a2 2 0 01-2-2V6a2 2 0 012-2h8a2 2 0 012 2v2m-6 12h8a2 2 0 002-2v-8a2 2 0 00-2-2h-8a2 2 0 00-2 2v8a2 2 0 002 2z"></path>
                </svg> <span class="ml-4">Modals</span>
					</a></li>
					<li class="relative px-6 py-3"><span
						class="absolute inset-y-0 left-0 w-1 bg-purple-600 rounded-tr-lg rounded-br-lg"
						aria-hidden="true"></span> <a
						class="inline-flex items-center w-full text-sm font-semibold text-gray-800 transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200 dark:text-gray-100"
						href="tables.html"> <svg class="w-5 h-5" aria-hidden="true"
								fill="none" stroke-linecap="round" stroke-linejoin="round"
								stroke-width="2" viewBox="0 0 24 24" stroke="currentColor">
                  <path d="M4 6h16M4 10h16M4 14h16M4 18h16"></path>
                </svg> <span class="ml-4">Tables</span>
					</a></li>
					<li class="relative px-6 py-3">
						<button
							class="inline-flex items-center justify-between w-full text-sm font-semibold transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200"
							@click="togglePagesMenu" aria-haspopup="true">
							<span class="inline-flex items-center"> <svg
									class="w-5 h-5" aria-hidden="true" fill="none"
									stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
									viewBox="0 0 24 24" stroke="currentColor">
                    <path
										d="M4 5a1 1 0 011-1h14a1 1 0 011 1v2a1 1 0 01-1 1H5a1 1 0 01-1-1V5zM4 13a1 1 0 011-1h6a1 1 0 011 1v6a1 1 0 01-1 1H5a1 1 0 01-1-1v-6zM16 13a1 1 0 011-1h2a1 1 0 011 1v6a1 1 0 01-1 1h-2a1 1 0 01-1-1v-6z"></path>
                  </svg> <span class="ml-4">마이페이지</span>
							</span>
							<svg class="w-4 h-4" aria-hidden="true" fill="currentColor"
								viewBox="0 0 20 20">
                  <path fill-rule="evenodd"
									d="M5.293 7.293a1 1 0 011.414 0L10 10.586l3.293-3.293a1 1 0 111.414 1.414l-4 4a1 1 0 01-1.414 0l-4-4a1 1 0 010-1.414z"
									clip-rule="evenodd"></path>
                </svg>
						</button>
						<template x-if="isPagesMenuOpen">
							<ul x-transition:enter="transition-all ease-in-out duration-300"
								x-transition:enter-start="opacity-25 max-h-0"
								x-transition:enter-end="opacity-100 max-h-xl"
								x-transition:leave="transition-all ease-in-out duration-300"
								x-transition:leave-start="opacity-100 max-h-xl"
								x-transition:leave-end="opacity-0 max-h-0"
								class="p-2 mt-2 space-y-2 overflow-hidden text-sm font-medium text-gray-500 rounded-md shadow-inner bg-gray-50 dark:text-gray-400 dark:bg-gray-900"
								aria-label="submenu">
								<li
									class="px-2 py-1 transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200">
									<a class="w-full" href="pages/login.html">회원정보수정</a>
								</li>
								<li
									class="px-2 py-1 transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200">
									<a class="w-full"
									href="${pageContext.request.contextPath}/modifyPw?myPageChangePw=1">비밀번호변경</a>
								</li>
								<li
									class="px-2 py-1 transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200">
									<a class="w-full" href="pages/blank.html">내가쓴글보기</a>
								</li>
							</ul>
						</template>
					</li>
				</ul>
			</div>
		</aside>
		<div class="flex flex-col flex-1 w-full">
			<header class="z-10 py-4 bg-white shadow-md dark:bg-gray-800">
				<div
					class="container flex items-center justify-between h-full px-6 mx-auto text-purple-600 dark:text-purple-300">
					<div class="flex justify-center flex-1 lg:mr-32">
						<div
							class="relative w-full max-w-xl mr-6 focus-within:text-purple-500">
						</div>
					</div>
					<ul class="flex items-center flex-shrink-0 space-x-6">
						<!-- Theme toggler -->
						<li class="flex">
							<button
								class="rounded-md focus:outline-none focus:shadow-outline-purple"
								@click="toggleTheme" aria-label="Toggle color mode">
								<template x-if="!dark">
									<svg class="w-5 h-5" aria-hidden="true" fill="currentColor"
										viewBox="0 0 20 20">
                      <path
											d="M17.293 13.293A8 8 0 016.707 2.707a8.001 8.001 0 1010.586 10.586z"></path>
                    </svg>
								</template>
								<template x-if="dark">
									<svg class="w-5 h-5" aria-hidden="true" fill="currentColor"
										viewBox="0 0 20 20">
                      <path fill-rule="evenodd"
											d="M10 2a1 1 0 011 1v1a1 1 0 11-2 0V3a1 1 0 011-1zm4 8a4 4 0 11-8 0 4 4 0 018 0zm-.464 4.95l.707.707a1 1 0 001.414-1.414l-.707-.707a1 1 0 00-1.414 1.414zm2.12-10.607a1 1 0 010 1.414l-.706.707a1 1 0 11-1.414-1.414l.707-.707a1 1 0 011.414 0zM17 11a1 1 0 100-2h-1a1 1 0 100 2h1zm-7 4a1 1 0 011 1v1a1 1 0 11-2 0v-1a1 1 0 011-1zM5.05 6.464A1 1 0 106.465 5.05l-.708-.707a1 1 0 00-1.414 1.414l.707.707zm1.414 8.486l-.707.707a1 1 0 01-1.414-1.414l.707-.707a1 1 0 011.414 1.414zM4 11a1 1 0 100-2H3a1 1 0 000 2h1z"
											clip-rule="evenodd"></path>
                    </svg>
								</template>
							</button>
						</li>
						<!-- Profile menu -->
						<li class="relative">
							<button
								class="align-middle rounded-full focus:shadow-outline-purple focus:outline-none"
								@click="toggleProfileMenu" @keydown.escape="closeProfileMenu"
								aria-label="Account" aria-haspopup="true">
								<img class="object-cover w-8 h-8 rounded-full"
									src="https://images.unsplash.com/photo-1502378735452-bc7d86632805?ixlib=rb-0.3.5&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=200&fit=max&s=aa3a807e1bbdfd4364d1f449eaa96d82"
									alt="" aria-hidden="true" />
							</button>
							<template x-if="isProfileMenuOpen">
								<ul x-transition:leave="transition ease-in duration-150"
									x-transition:leave-start="opacity-100"
									x-transition:leave-end="opacity-0"
									@click.away="closeProfileMenu"
									@keydown.escape="closeProfileMenu"
									class="absolute right-0 w-56 p-2 mt-2 space-y-2 text-gray-600 bg-white border border-gray-100 rounded-md shadow-md dark:border-gray-700 dark:text-gray-300 dark:bg-gray-700"
									aria-label="submenu">
									<li class="flex"><a
										class="inline-flex items-center w-full px-2 py-1 text-sm font-semibold transition-colors duration-150 rounded-md hover:bg-gray-100 hover:text-gray-800 dark:hover:bg-gray-800 dark:hover:text-gray-200"
										href="#"> <svg
												class="w-4 h-4 mr-3" aria-hidden="true" fill="none"
												stroke-linecap="round" stroke-linejoin="round"
												stroke-width="2" viewBox="0 0 24 24" stroke="currentColor">
                          <path
													d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z"></path>
                        </svg> <span>Profile</span>
									</a></li>
									<li class="flex"><a
										class="inline-flex items-center w-full px-2 py-1 text-sm font-semibold transition-colors duration-150 rounded-md hover:bg-gray-100 hover:text-gray-800 dark:hover:bg-gray-800 dark:hover:text-gray-200"
										href="${pageContext.request.contextPath}/logout"> <svg
												class="w-4 h-4 mr-3" aria-hidden="true" fill="none"
												stroke-linecap="round" stroke-linejoin="round"
												stroke-width="2" viewBox="0 0 24 24" stroke="currentColor">
                          <path
													d="M11 16l-4-4m0 0l4-4m-4 4h14m-5 4v1a3 3 0 01-3 3H6a3 3 0 01-3-3V7a3 3 0 013-3h7a3 3 0 013 3v1"></path>
                        </svg> <span>Log out</span>
									</a></li>
								</ul>
							</template>
						</li>
					</ul>
				</div>
			</header>
			<main class="h-full pb-16 overflow-y-auto">
				<div class="container grid px-6 mx-auto">
					<h2
						class="my-6 text-2xl font-semibold text-gray-700 dark:text-gray-200">${loginUser}님의
						add Survey Question</h2>
					<!-- CTA -->
					<a
						class="flex items-center justify-between p-4 mb-8 text-sm font-semibold text-purple-100 bg-purple-600 rounded-lg shadow-md focus:outline-none focus:shadow-outline-purple"
						href="${pageContext.request.contextPath}/getSubjectByPage">
						<div class="flex items-center">
							<svg class="w-5 h-5 mr-2" fill="currentColor" viewBox="0 0 20 20">
                  <path
									d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z"></path>
                </svg>
							<span>Subject Management Page</span>
						</div> <span>강좌 목록 &RightArrow;</span>
					</a>

					<!-- With avatar -->
					<h4
						class="mb-4 text-lg font-semibold text-gray-600 dark:text-gray-300">
						강의 영상 추가</h4>
					<div class="w-full mb-8 overflow-hidden rounded-lg shadow-xs">
						<div class="w-full overflow-x-auto">
							<form id="addSurveyQuestionForm" method="post"
								action="${pageContext.request.contextPath}/addSurveyQuestion">
								<table class="w-full whitespace-no-wrap">
									<tr class="text-gray-700 dark:text-gray-400">
										<td class="px-4 py-3">
											<div class="flex items-center text-sm">
												<!-- Avatar with inset shadow -->
												<div>
													<p class="font-semibold">만족도 질문</p>
												</div>
											</div>
										</td>
										<td class="px-4 py-3">
											<div class="flex items-center text-sm">
												<!-- Avatar with inset shadow -->
												<div>
													<p class="font-semibold">
														<input type="hidden" name="subjectNo" value="${subjectNo}">
														<input
															class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
															type="text" id="surveyQuestion"
															name="surveyQuestion" placeholder="질문을 입력하세요">
													</p>
												</div>
											</div>
										</td>
									</tr>
								</table>
								<br>
								<div style="display: inline;">
									<div style="float: inherit;"display:inline-block;"></div>
									<button
										class="px-10 py-4 font-medium leading-5 text-white transition-colors duration-150 bg-purple-600 border border-transparent rounded-lg active:bg-purple-600 hover:bg-purple-700 focus:outline-none focus:shadow-outline-purple"
										style="margin: auto; display: block;" type="button"
										id="addBtn">질문 추가</button>
								</div>
							</form>
						</div>
						<br>
					</div>
				</div>
			</main>
		</div>
	</div>
</body>
<script>
	$('#addBtn').click(function() {
		if ($('#surveyQuestion').val() == '') {
			Swal.fire('질문을 입력해주세요');
			return;
		} else {
			$('#addSurveyQuestionForm').submit();
		}
	});
</script>
</html>
