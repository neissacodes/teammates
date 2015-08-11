<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib tagdir="/WEB-INF/tags/instructor/results" prefix="r" %>
<%@ page import="teammates.common.util.Const"%>
<%@ page import="teammates.common.util.TimeHelper"%>
<%-- When the page structure is loaded, bundle.questions will contain every question --%>
<%-- When generating the noResponsePanel when loaded by ajax, there won't be any questions in the bundle --%>
<%-- TODO it might make sense to make a new action entirely for generating the noResponsePanel --%>
<c:set var="isLoadingStructure" value="${not empty data.bundle.questions}" />

<c:if test="${data.allSectionsSelected}">
    <div class="panel panel-warning">
        <%-- see instructorFeedbackResultsAjaxResponseRate.js --%>
        <div class="panel-heading${data.largeNumberOfResponses ? ' ajax_response_rate_submit' : ' ajax_response_rate_auto'}">
            <form style="display:none;" id="responseRate" class="responseRateForm" action="<%=Const.ActionURIs.INSTRUCTOR_FEEDBACK_RESULTS_PAGE%>">
                <input type="hidden" name="<%=Const.ParamsNames.COURSE_ID%>" value="${data.bundle.feedbackSession.courseId}">
                <input type="hidden" name="<%=Const.ParamsNames.FEEDBACK_SESSION_NAME%>" value="${data.bundle.feedbackSession.feedbackSessionName}">
                <input type="hidden" name="<%=Const.ParamsNames.USER_ID%>" value="${data.account.googleId}">
                <input type="hidden" name="<%=Const.ParamsNames.FEEDBACK_QUESTION_NUMBER%>" value="-1">
            </form>
            <div class="display-icon pull-right">
                <span class="glyphicon${!isLoadingStructure ? ' glyphicon-chevron-up' : ' glyphicon-chevron-down'} pull-right"></span>
            </div>
            Participants who have not responded to any question
        </div>
        <div class="panel-collapse collapse" id="responseStatus">
            <c:if test="${!isLoadingStructure}">
                <r:noResponsePanel noResponsePanel="${data.noResponsePanel}" />
            </c:if>
        </div>
    </div>
</c:if>