<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include.jsp"%>

<c:if test="${user.isStaff}">
	<div id="myslidemenu" class="jqueryslidemenu">
		<!-- 孵化器管理者 -->
		<ul>
			<li class="pic_a"></li>

			<li><a href="adminMain.htm"><s:message code="menuPart.s1"
						text="首頁" /> </a></li>

			<li><a href="todo.htm"><s:message code="menuPart.todo"
						text="待辦事項" /> </a></li>


			<li><a class="trigger" href="#"><s:message
						code="menuPart.movin.management" text="進駐管理" /> </a>
				<ul>
					<!-- 					<li>
						<a href="memberList.htm">會員用戶</a>
					</li>
					-->
					<li><a href="compList_B.htm"><s:message
								code="menuPart.movin.apply" text="進駐申請" /> </a></li>

					<li><a href="reviewPaperList.htm"><s:message
								code="menuPart.movin.review" text="審查管理" /> </a></li>
					<li><a href="compWaitList_B.htm"><s:message
								code="menuPart.movin.check" text="待轉進駐" /> </a></li>
					<li><a href="compList.htm"><s:message
								code="menuPart.movin.business" text="進駐企業" /> </a></li>
					<!-- 
					<li>
						<a href="companyUserList.htm">企業用戶</a>
					</li>
-->
				</ul></li>

			<%-- 
			<li>
				<a class="trigger" href="#"><s:message code="menuPart.s1"
						text="帳務管理" />
				</a>
				<ul>
					<li>
						<a href="cashierList.htm"><s:message code="menuPart.s1"
								text="出納人員" />
						</a>
					</li>
					<li>
						<a href="financialOfficerList.htm"><s:message
								code="menuPart.s1" text="財務人員" />
						</a>
					</li>
					<li>
						<a href="feesList.htm"><s:message code="menuPart.s1"
								text="帳務記錄" />
						</a>
					</li>
				</ul>
			</li>
--%>

			<li><a class="trigger" href="#"><s:message
						code="menuPart.consult.management" text="輔導管理" /> </a>
				<ul>
					<li><a href="talkNotesList.htm"><s:message
								code="menuPart.consult.all" text="所有輔導紀錄" /> </a></li>
					<li><a href="talkNotesMyListTeacher.htm"><s:message
								code="menuPart.consult.teacher" text="業師輔導紀錄" /> </a></li>
					<li><a href="talkNotesMyListAM.htm"><s:message
								code="menuPart.consult.AM" text="我的 AM 輔導紀錄" /> </a></li>
					<li><a href="talkNotesMyListPM.htm"><s:message
								code="menuPart.consult.PM" text="我的 PM 輔導紀錄" /> </a></li>
					<li><a href="talkNotesMyListOther.htm"><s:message
								code="menuPart.consult.other" text="我的其他輔導紀錄" /> </a></li>
				</ul></li>

			<li><a href="activityRecList.htm"><s:message
						code="menuPart.activity" text="活動管理" /> </a></li>


			<li><a href="#"><s:message code="incubate.resource"
						text="育成資源" /> </a>
				<ul>
					<li><a href="teacherList.htm"><s:message
								code="incubate.resource.teacher" text="輔導業師" /> </a></li>
					<li><a href="reviewerList.htm"><s:message
								code="incubate.resource.reviewer" text="審查委員" /> </a></li>
					<li><a href="staffList.htm"><s:message
								code="incubate.resource.staff" text="中心人員" /> </a></li>
					<li><a href="outsourceList.htm"><s:message
								code="outsource.management" text="採購管理" /> </a></li>
					<li><a href="roomList.htm"><s:message
								code="room.management" text="培育間管理" /> </a></li>
					<li><a href="parkingLotList.htm"><s:message
								code="parkingCar.management" text="汽車停車位管理" /> </a></li>
					<li><a href="parkingLotBikeList.htm"><s:message
								code="parkingBike.management" text="機車停車位管理" /> </a></li>
					<li><a href="securityCardList.htm"><s:message
								code="securityCard.management" text="門禁卡管理" /> </a></li>
				</ul></li>

			<%-- 
			<li>
				<a href="warning.htm"><s:message code="menuPart.s1" text="加值服務" />
				</a>
			</li>
			--%>

			<li><a class="trigger" href="#"><s:message
						code="menuPart.system.setting" text="系統設定" /> </a>
				<ul>
					<li><a href="administratorList.htm"><s:message
								code="menuPart.system.manager" text="系統管理者設定" /> </a></li>
					<li><a href="tagList.htm"><s:message code="menuPart.tag"
								text="Tag 設定" /> </a></li>
					<!-- 
					<li>
						<a href="user.htm"><s:message code="menuPart.s1" text="使用者設定" />
						</a>
					</li>
					-->

					<li><a href="changePwd.htm"><s:message
								code="menuPart.change.pwd" text="變更密碼" /> </a></li>
				</ul></li>

			<li><a href="login.htm"><s:message code="menuPart.logout"
						text="登出" /> </a></li>
		</ul>


		<br class="clearit">
	</div>
</c:if>

<c:if test="${user.isBusiness}">
	<!-- 企業 -->
	<div id="myslidemenu" class="jqueryslidemenu">
		<ul>
			<li class="pic_a"></li>
			<li><a href="businessMain.htm"><s:message code="menuPart.s1"
						text="首頁" /></a></li>
			<li><a href="compDetailView.htm"><s:message
						code="menuPart.my.business.info" text="我的信息" /> </a></li>

			<li><a class="trigger" href="#"><s:message
						code="menuPart.service.apply" text="服務申請" /> </a>
				<ul>
					<li><a href="requestListTeacher.htm"><s:message
								code="menuPart.service.teacher" text="業師服務" /> </a></li>
					<li><a href="requestListAM.htm"><s:message
								code="menuPart.service.AM" text="AM 服務" /> </a></li>
					<li><a href="requestListPM.htm"><s:message
								code="menuPart.service.PM" text="PM 服務" /> </a></li>
				</ul></li>

			<!-- 
			<li>
				<a href="announcementList.htm">通知公告</a>
			</li>
			-->

			<!--
			<li>
				<a class="trigger" href="#">服務申請</a>
				<ul>
					<li>
						<a href="userServiceResourceAcceptList.htm?categorize=1">一般服務申請</a>
					</li>
					<li>
						<a href="userServiceResourceAcceptList.htm?categorize=2">會議室申請</a>
					</li>
					<li>
						<a href="userServiceResourceAcceptList.htm?categorize=4">培育間申請</a>
					</li>
					<li>
						<a href="userServiceResourceAcceptList.htm?categorize=5">顧問服務申請</a>
					</li>
					<li>
						<a href="userServiceResourceAcceptList.htm?categorize=6">業師服務申請</a>
					</li>
				</ul>
			</li>
			-->
			<!-- 
			<li>
				<a class="trigger" href="#">中心信息</a>
				<ul>
					<li>
						<a href="managementDeptList.htm">服務窗口</a>
					</li>
					<li>
						<a href="providesList.htm">中心規定</a>
					</li>
					<li>
						<a href="SharedThingList.htm?type=form">業務表單</a>
					</li>
					<li>
						<a href="SharedThingList.htm?type=doc">文檔共享</a>
					</li>
					<li>
						<a href="SharedThingList.htm?type=equipment">設備共享</a>
					</li>
					<li>
						<a class="trigger" href="problemsList.htm">常見問題</a>
					</li>
				</ul>
			</li>
			 -->

			<li><a class="trigger" href="#"><s:message
						code="menuPart.system.setting" text="系統設定" /> </a>
				<ul>
					<li><a href="changePwd.htm"><s:message
								code="menuPart.change.pwd" text="變更密碼" /> </a></li>
				</ul></li>
			<li><a href="login.htm"><s:message code="menuPart.logout"
						text="登出" /> </a></li>
		</ul>
		<br class="clearit">
	</div>
</c:if>


<c:if test="${user.isAdmin}">
	<!-- 系統管理者 -->
	<div id="myslidemenu" class="jqueryslidemenu">
		<ul>
			<!-- 
			<li>
				<a class="trigger" href="#"><s:message code="menuPart.system.setting"
						text="系統設定" />
				</a>
				<ul>
					<li>
						<a href="user.htm"><s:message code="menuPart.s1" text="使用者設定" />
						</a>
					</li>
				</ul>
			</li>
			-->
			<li><a href="login.htm"><s:message code="menuPart.logout"
						text="登出" /> </a></li>
		</ul>
		<br class="clearit">
	</div>
</c:if>

<%--
<c:if test="${user.isMember}">
	<!-- 會員 -->
	<div id="myslidemenu" class="jqueryslidemenu">
		<ul>


			<li>
				<a href="compNew_B0.htm"><s:message code="menuPart.s1"
						text="申請進駐" />
				</a>
			</li>

			<li>
				<a href="compList_B0.htm"><s:message code="menuPart.s1"
						text="查詢申請" />
				</a>
			</li>


			<li>
				<a href="changePwd.htm"><s:message code="menuPart.change.pwd"
						text="變更密碼" />
				</a>
			</li>
			<li>
				<a href="login.htm"><s:message code="menuPart.logout" text="登出" />
				</a>
			</li>
		</ul>
		<br class="clearit">
	</div>
</c:if>


<c:if test="${user.isReviewer}">
	<!-- 審查委員 -->
	<div id="myslidemenu" class="jqueryslidemenu">
		<ul>
			<li>
				<a href="reviewPaperJobList.htm"><s:message code="menuPart.s1"
						text="審查" />
				</a>
			</li>
			<li>
				<a href="changePwd.htm"><s:message code="menuPart.change.pwd"
						text="變更密碼" />
				</a>
			</li>
			<li>
				<a href="login.htm"><s:message code="menuPart.logout" text="登出" />
				</a>
			</li>
		</ul>
		<br class="clearit">
	</div>
</c:if>
 --%>