<!DOCTYPE html>
<html ng-App="myApp" xmlns:mso="urn:schemas-microsoft-com:office:office" xmlns:msdt="uuid:C2F41010-65B3-11d1-A29F-00AA00C14882">
<%@ Register Tagprefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<head>
      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE11">
	  <meta name="author" content="Michael J. Mosley">
     
      <title>PLSO Incident Response</Title>
	  <link rel="icon" href="/sites/FMRE012/SiteCollectionImages/PLSO%20Icon.png">
	 
	<link href="/sites/FMRE012/SiteAssets/unity-1.3.0/css/em-unity-1.3.0.min.css" media="all" rel="stylesheet" />
	<link href="/sites/FMRE012/Apps/Scripts/unity-1.7.0/css/em-unity-1.7.0.css" media="all" rel="stylesheet" />
	<link href="/sites/FMRE012/SiteAssets/CSS/jquery-ui-smoothness.css" media="all" rel="stylesheet" />
	<link href="/sites/FMRE012/SiteAssets/CSS/Loader.css" media="all" rel="stylesheet" />
	<link type="text/css" href="/sites/FMRE012/SiteAssets/CSS/dropdownselect.css" rel="stylesheet" /> 
	<link type="text/css" href="/sites/FMRE012/SiteAssets/CSS/jquery.simple-dtpicker.css" rel="stylesheet" />
	
	<style>

/* Make Action tables auto-fit and readable */
#IRTActionsTable,
#ESGActionsTable {
    table-layout: auto !important;
    width: 100% !important;
    border-collapse: collapse;
}

/* Allow all table cells to wrap text */
#IRTActionsTable td,
#ESGActionsTable td {
    white-space: normal !important;
    word-wrap: break-word !important;
    vertical-align: top !important;
    padding: 4px 6px !important;
    line-height: 1.3;
    max-width: 400px;
}

/* Adjust header behavior */
#IRTActionsTable th,
#ESGActionsTable th {
    white-space: nowrap;
    padding: 6px;
}

/* Make editable inputs compact but readable */
.edit-action-field {
    width: 100%;
    font-size: 12px !important;
    padding: 2px 4px !important;
    margin: 0;
    border: 1px solid #ccc;
    border-radius: 3px;
    box-sizing: border-box;
    background: #fff;
}

/* Inputs & selects compact height */
.edit-action-field[type="text"],
.edit-action-field[type="date"],
select.edit-action-field {
    height: 22px !important;
}

/* Notes textarea auto-wrap and auto-fit */
textarea.edit-action-field {
    min-height: 34px !important;
    max-height: 150px;
    overflow-y: auto !important;
    resize: vertical !important;
    white-space: pre-wrap;
}

/* People Picker compact */
.people-picker-input {
    font-size: 12px !important;
    height: 22px !important;
    padding: 2px 4px !important;
    width: 100% !important;
}

/* Wrapper ensures picker fits column */
.people-picker-container {
    width: 100%;
    position: relative;
}

/* Dropdown for People Picker */
.people-picker-results {
    display: none;
    position: absolute;
    top: 22px;
    left: 0;
    right: 0;
    background: #ffffff;
    border: 1px solid #ccc;
    z-index: 9999;
    max-height: 150px;
    overflow-y: auto;
    font-size: 12px;
}

.people-picker-results div {
    padding: 6px 8px;
    cursor: pointer;
}

.people-picker-results div:hover {
    background: #e8f0ff;
}

/* Make Action Title column wider */
#IRTActionsTable td:nth-child(1),
#ESGActionsTable td:nth-child(1) {
    width: 25% !important;
}

/* Make Notes column the widest */
#IRTActionsTable td:nth-child(7),
#ESGActionsTable td:nth-child(7) {
    width: 35% !important;
}

/* Narrow columns (Priority, Dates, Time Zone) */
#IRTActionsTable td:nth-child(3),
#IRTActionsTable td:nth-child(4),
#IRTActionsTable td:nth-child(5),
#IRTActionsTable td:nth-child(6),
#ESGActionsTable td:nth-child(3),
#ESGActionsTable td:nth-child(4),
#ESGActionsTable td:nth-child(5),
#ESGActionsTable td:nth-child(6) {
    width: 90px !important;
    white-space: nowrap !important;
    text-align: center;
}

</style>
	
	<style>
	.people-picker-container {
		position: relative;
		width: 100%;
	}

	.people-picker-input {
		font-size: 12px !important;
		padding: 2px 4px !important;
		height: 22px !important;
	}

	.people-picker-results {
		display: none;
		position: absolute;
		top: 22px;
		left: 0;
		right: 0;
		background: white;
		border: 1px solid #ccc;
		z-index: 9999;
		max-height: 150px;
		overflow-y: auto;
		font-size: 12px;
	}

	.people-picker-results div {
		padding: 5px 6px;
		cursor: pointer;
	}

	.people-picker-results div:hover {
		background: #e6f0ff;
	}
	</style>
	
	<script src="https://unpkg.com/xlsx/dist/xlsx.full.min.js" type="text/javascript"></script>	
	<script src="/sites/FMRE012/SiteAssets/jquery-3.3.1.min.js" type="text/javascript"></script>
	<script src="/sites/FMRE012/SiteAssets/unity-1.3.0/js/vendor/svg4everybody.min.js" type="text/javascript"></script><!-- polyfill for SVG icons -->
	<script src="https://ajax.aspnetcdn.com/ajax/4.0/1/MicrosoftAjax.js" type="text/javascript"></script>
	<script src="/sites/FMRE012/SiteAssets/jquery.SPServices.js" type="text/javascript"></script>
	<script src="/_layouts/15/sp.runtime.js" type="text/javascript"></script>
	<script src="/_layouts/15/sp.js" type="text/javascript"></script>
	<script src="/sites/FMRE012/SiteAssets/JS/SortTable.js" type="text/javascript"></script>
	<script src="/sites/FMRE012/SiteAssets/JS/jquery.simple-dtpicker.js" type="text/javascript"></script>
	<script src="/sites/FMRE012/SiteAssets/JS/DropdownSelect.js" type="text/javascript"></script>
	

	
	
<script>
var siteURL = '/sites/FMRE012';
var IncidentID = 0;
var Incident = "";
var ItemID = 0;
var EditID = 0;
var ListID = 0;
var userID = 0;
var Team = "IRT";
var myVar;
var QueryLink = "";
var IncidentLink = "";
var FormMode = "New";
var CountriesArray = [];
var VendorsArray = [];

window.onbeforeunload = function () {
  window.scrollTo(0, 0);
}

function showPage() {
  <!-- document.body.innerHTML = document.body.innerHTML.replace(/undefined/g, '');  -->
  $('td').html(function(i, html){return html.replace(/undefined/g, '');	});
  
  $("#MyLoader").hide();
  $("#IRTContainer").show();
  $("#Alert").show();
  $("#Footer").show();
  $('.demo').fSelect();
  
  if (StartTeam == "ESG") { 
	$('#toggle-ESG').click(); 
	$('#toggle-ESG').trigger('click'); 	} 
}

function StartUp() {
	angular.element(document.body).scope().dft.rowUsers = {};
	angular.element(document.body).scope().$apply();

    IncidentID = getParameterByName("ID");
    StartTeam = getParameterByName("Team");

    myVar = setTimeout(showPage, 100);

    // Run ALL list loads in parallel
    Promise.all([
        getIncidentListData(IncidentID),
        getEventsListData(IncidentID),
        getObjectivesListData(IncidentID),
        getActionsListData(IncidentID),
        getWorstCaseListData(IncidentID),
        getRespondingTeamListData(IncidentID),
        getKeyDocsListData(IncidentID),
        getCountryListData(),
        getVendorListData()
    ])
    .then(() => {
        console.log("✅ All lists loaded.");
        // Optional: show page only when everything is ready
        // showPage();
    })
    .catch(err => {
        console.error("❌ One or more list loads failed:", err);
    });
}

function searchUsers(query) {

    let url = siteURL +
        "/_api/web/siteusers?$filter=substringof('" +
        query +
        "',Title)&$select=Id,Title,Email";

    return $.ajax({
        url: url,
        method: "GET",
        headers: { Accept: "application/json;odata=verbose" }
    });
}

<!-- SP.SOD.executeFunc('SP.js', 'SP.ClientContext', function() -->
<!-- { -->
  <!-- var _ctx = SP.ClientContext.get_current();       -->
<!-- }); -->
<!-- function getCurrentUser() { -->
<!-- var currentUser; -->
    <!-- var clientContext = new SP.ClientContext.get_Current(); -->
	<!-- currentUser = clientContext.get_web().get_currentUser(); -->
	<!-- clientContext.load(currentUser);      -->
    <!-- this.clientContext.executeQueryAsync(Function.createDelegate(this,this.onUserQuerySucceeded), Function.createDelegate(this,this.onUserQueryFailed)); -->
<!-- } -->

<!-- function onUserQuerySucceeded() { -->
    <!-- var LoginName = currentUser.get_loginName();  -->
    <!-- var UserID = currentUser.get_id();  -->
    <!-- var UserTitle = currentUser.get_title();  -->
    <!-- var UserEmail = currentUser.get_email();  -->
	<!-- console.log ("LoginName: " + LoginName + ", UserID: " + UserID + ", UserTitle: " + UserTitle + ", UserEmail: " + UserEmail); -->
<!-- } -->

<!-- function onUserQueryFailed(sender, args) { -->
    <!-- alert('Request failed. \nError: ' + args.get_message() + '\nStackTrace: ' + args.get_stackTrace()); -->
<!-- } -->


	
function getParameterByName(name, url) {
    if (!url) url = window.location.href;
    name = name.replace(/[\[\]]/g, '\\$&');
    var regex = new RegExp('[?&]' + name + '(=([^&#]*)|&|#|$)'),
        results = regex.exec(url);
    if (!results) return null;
    if (!results[2]) return '';
    return decodeURIComponent(results[2].replace(/\+/g, ' '));
}
</script>

<!-- uncoment the folllowing when using SPA (e.g. Angular, React, etc). For traditional websites, Unity JS handles this automagically :) -->
<!-- <div class="em-c-header-overlay"></div> -->

<!--[if gte mso 9]><SharePoint:CTFieldRefs runat=server Prefix="mso:" FieldList="FileLeafRef,WikiField,MPI_x0020_Classification,Keywords"><xml>
<mso:CustomDocumentProperties>
<mso:Keywords msdt:dt="string"></mso:Keywords>
<mso:MPI_x0020_Classification msdt:dt="string">Not Classified</mso:MPI_x0020_Classification>
</mso:CustomDocumentProperties>
</xml></SharePoint:CTFieldRefs><![endif]-->
</head>
<!-- end head -->

<body onload="StartUp()" ng-controller="DefaultController as dft">

<!-- ⭐ ADD THESE TWO LINES ⭐ -->
    <form runat="server">
	<SharePoint:FormDigest ID="FormDigest1" runat="server" />


<header class="em-c-header em-c-header--condensed" role="banner">
  <div class="em-l-container em-c-header__inner">
    <div class="em-c-header__body">
      <div class="em-c-header__title-container">
        <h4 class="em-c-header__kicker">PLSO Incident Response</h4>
		<h2 class="em-c-header__title"><a href="#" rel="home" class="em-c-header__title-link" id="IncidentName">Incident Name</a></h2>
      </div>
      <!-- end em-c-header__left -->
      <button id="BtnMenu" class="em-c-btn em-c-btn--small em-c-btn--inverted em-c-header__nav-btn em-js-nav-trigger">
        <div class="em-c-btn__inner">
          <svg class="em-c-icon em-c-icon--small em-c-btn__icon em-js-btn-icon" data-em-btn-toggle-text="Close" data-em-icon-path="/sites/FMRE012/SiteAssets/unity-1.3.0/images/em-icons.svg">
            <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="/sites/FMRE012/SiteAssets/unity-1.3.0/images/em-icons.svg#hamburger"></use>
          </svg>
          <svg class="em-c-icon em-c-icon--small em-c-btn__icon em-u-is-hidden em-js-btn-swap-icon" data-em-icon-path="/sites/FMRE012/SiteAssets/unity-1.3.0/images/em-icons.svg">
            <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="/sites/FMRE012/SiteAssets/unity-1.3.0/images/em-icons.svg#x-filled"></use>
          </svg>
          <span class="em-c-btn__text em-js-btn-label">Menu</span>
        </div>
      </button>
      <!-- end em-c-btn -->
      <div class="em-c-header__nav-container em-js-nav-panel">
        <nav id="nav" class="em-c-primary-nav" role="navigation">
          <ul class="em-c-primary-nav__list">
		  						<li class="em-c-primary-nav__item "> <!-- Team Toggle -->
              			     <div class="em-c-toggle">
      <input class="em-c-toggle__input em-u-is-vishidden"  type="radio" id="toggle-IRT" name="toggleTeam" onclick="FilterTeam()" checked />
      <label class="em-c-toggle__label" for="toggle-IRT">
        IRT
      </label>
      <input class="em-c-toggle__input em-u-is-vishidden"  type="radio" id="toggle-ESG" name="toggleTeam" onclick="FilterTeam()" />
      <label class="em-c-toggle__label"  for="toggle-ESG">
        ESG
      </label>
    </div>
            </li>
		  <li class="em-c-primary-nav__item " id="HomeBtn">
		  <a href="javascript:location.reload();" class="em-c-primary-nav__link " >
			<svg class="em-c-icon em-c-icon--small em-c-btn__icon " data-em-icon-path="/sites/FMRE012/SiteAssets/unity-1.3.0/images/em-icons.svg">
			<use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="/sites/FMRE012/SiteAssets/unity-1.3.0/images/24/em-icons.svg#home"></use>
			</svg>&nbsp;Home</a>
		 </li>            
            <li class="em-c-primary-nav__item "> <!-- New Items -->
              <a href="#" class="em-c-primary-nav__link  em-c-primary-nav__link--has-children em-js-nav-dropdown-trigger">Add New Item
					<svg class="em-c-icon em-c-icon--small em-c-primary-nav__icon"><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="/sites/FMRE012/SiteAssets/unity-1.3.0/images/em-icons.svg#caret-down"></use>
					     </svg></a>
              <!--end em-c-primary-nav__link-->
			  <div class="em-c-primary-nav__sublist  em-js-nav-dropdown ">
                <ul>
                  
                  <!-- end em-c-nav__sublist__item -->
				  <li class="em-c-primary-nav__subitem">
                    <a href="#" class="em-c-primary-nav__sublink" id="EventsBtn">Event/Key Fact</a>
                  </li>
                  <li class="em-c-primary-nav__subitem">
                    <a href="#" class="em-c-primary-nav__sublink" id="ObjectivesBtn">Objective</a>
                  </li>
                  <li class="em-c-primary-nav__subitem">
                    <a href="#" class="em-c-primary-nav__sublink" id="ActionsBtn">Action</a>
                  </li>
                  <li class="em-c-primary-nav__subitem">
                    <a href="#" class="em-c-primary-nav__sublink" id="WorstCaseBtn" style="display:none">Worst Case Scenario</a>
                  </li>
				  <li class="em-c-primary-nav__subitem">
                    <a href="#" class="em-c-primary-nav__sublink" id="TeamBtn">Team Member</a>
                  </li>
				  <li class="em-c-primary-nav__subitem">
                    <a href="#" class="em-c-primary-nav__sublink" id="DocumentsBtn">Key Documents</a>
                  </li>				  
                </ul>
              </div>
              <!-- end em-c-nav__sublist -->
            </li>
			<li class="em-c-primary-nav__item "> <!-- Send Notifications -->
              <a href="#" class="em-c-primary-nav__link  em-c-primary-nav__link--has-children em-js-nav-dropdown-trigger">Send Notifications
					<svg class="em-c-icon em-c-icon--small em-c-primary-nav__icon"><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="/sites/FMRE012/SiteAssets/unity-1.3.0/images/em-icons.svg#caret-down"></use>
					     </svg></a>
              <!--end em-c-primary-nav__link-->
			  <div class="em-c-primary-nav__sublist  em-js-nav-dropdown ">
                <ul>
                  <li class="em-c-primary-nav__subitem">
                    <a href='#' onclick='javascript:CreateEmail("InternalBriefing");' class="em-c-primary-nav__sublink" >Internal Briefing</a>
                  </li>
                  <!-- end em-c-nav__sublist__item -->
                  <li class="em-c-primary-nav__subitem">
                    <a href="#" onclick='javascript:CreateEmail("ExternalBriefing");' class="em-c-primary-nav__sublink" >External Briefing</a>
                  </li>
                  <!-- end em-c-nav__sublist__item -->
                  <li class="em-c-primary-nav__subitem">
                    <a href="#" onclick='javascript:$("#ModalESG").show();' class="em-c-primary-nav__sublink" >Activate ESG</a>
                  </li>
                  <!-- end em-c-nav__sublist__item -->
                  <li class="em-c-primary-nav__subitem">
                    <a href="#" onclick='javascript:CreateEmail("IncidentCloseout");' class="em-c-primary-nav__sublink" >Incident Closeout</a>
                  </li>
                  <!-- end em-c-nav__sublist__item -->
				  <div class="em-c-primary-nav__subitem em-c-primary-nav__subitem-footer">A draft Email will open in Outlook.</div>
                </ul>
              </div>
              <!-- end em-c-nav__sublist -->
            </li>
			<li class="em-c-primary-nav__item "> <!-- Send Notifications -->
              <a href="#" class="em-c-primary-nav__link  em-c-primary-nav__link--has-children em-js-nav-dropdown-trigger">Useful Links
					<svg class="em-c-icon em-c-icon--small em-c-primary-nav__icon"><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="/sites/FMRE012/SiteAssets/unity-1.3.0/images/em-icons.svg#caret-down"></use>
					     </svg></a>
              <!--end em-c-primary-nav__link-->
			  <div class="em-c-primary-nav__sublist  em-js-nav-dropdown ">
			    <ul>
				<li class="em-c-primary-nav__subitem"><a href="#" class="em-c-primary-nav__sublink" ><b>Sites</b></a></li>
                <li class="em-c-primary-nav__subitem"><a href="/sites/FMRE012/SitePages/Home.aspx" class="em-c-primary-nav__sublink" target="_blank">Global PLSO Team Site</a></li>
				<li class="em-c-primary-nav__subitem"><a href='/sites/FMRE012/SitePages/IRP.aspx' class="em-c-primary-nav__sublink" target="_blank">Incident Response Home</a></li>
                <li class="em-c-primary-nav__subitem"><a href="/sites/FMRE012/SitePages/VMO.aspx" class="em-c-primary-nav__sublink" target="_blank">Vendor Management</a></li>    
				<li class="em-c-primary-nav__subitem"><a href="#" class="em-c-primary-nav__sublink" ><b>Documents</b></a></li>
				<li class="em-c-primary-nav__subitem"><a href="/sites/FMRE012/PLSO%20Documents/Forms/AllItems.aspx#InplviewHash965ff600-8b73-4583-adb7-69000c2baa4d=FilterField1%3DSub%255Fx002d%255FTopics-FilterValue1%3DArchitecture" class="em-c-primary-nav__sublink" target="_blank">Architecture</a></li>
				<li class="em-c-primary-nav__subitem"><a href="/sites/FMRE012/PLSO%20Documents/Forms/AllItems.aspx#InplviewHash965ff600-8b73-4583-adb7-69000c2baa4d=FilterField1%3DSub%255Fx002d%255FTopics-FilterValue1%3DData%2520Security" class="em-c-primary-nav__sublink" target="_blank">Data Security</a></li>
				<li class="em-c-primary-nav__subitem"><a href="/sites/FMRE012/PLSO%20Documents/Forms/AllItems.aspx#InplviewHash965ff600-8b73-4583-adb7-69000c2baa4d=FilterField1%3DSub%255Fx002d%255FTopics-FilterValue1%3DEcosystem" class="em-c-primary-nav__sublink" target="_blank">Ecosystem</a></li>
				<li class="em-c-primary-nav__subitem"><a href="/sites/FMRE012/PLSO%20Documents/Forms/AllItems.aspx#InplviewHash965ff600-8b73-4583-adb7-69000c2baa4d=FilterField1%3DSub%255Fx002d%255FTopics-FilterValue1%3DEscalation%2520Process" class="em-c-primary-nav__sublink" target="_blank">Escalation Process</a></li>
				<li class="em-c-primary-nav__subitem"><a href="/sites/FMRE012/PLSO%20Documents/Forms/AllItems.aspx#InplviewHash965ff600-8b73-4583-adb7-69000c2baa4d=FilterField1%3DSub%255Fx002d%255FTopics-FilterValue1%3DFlow%2520Diagrams" class="em-c-primary-nav__sublink" target="_blank">Flow Diagrams</a></li>
				<li class="em-c-primary-nav__subitem"><a href="/sites/FMRE012/PLSO%20Documents/Forms/AllItems.aspx#InplviewHash965ff600-8b73-4583-adb7-69000c2baa4d=FilterField1%3DSub%255Fx002d%255FTopics-FilterValue1%3DSkimming" class="em-c-primary-nav__sublink" target="_blank">Skimming</a></li>
				<li class="em-c-primary-nav__subitem"><a href="/sites/FMRE012/PLSO%20Documents/Forms/AllItems.aspx#InplviewHash965ff600-8b73-4583-adb7-69000c2baa4d=FilterField1%3DSub%255Fx002d%255FTopics-FilterValue1%3DSystem%2520Diagrams" class="em-c-primary-nav__sublink" target="_blank">System Diagrams</a></li>
				</ul>
              </div>
              <!-- end em-c-nav__sublist -->
            </li>
		   </ul>
          <!-- end em-c-nav__list -->
        </nav>
        <!-- end em-c-nav -->
      </div>
      <!-- end em-c-header__nav -->
    </div>
    <!-- end em-c-header__body -->
  </div>
  <!-- end em-l-container -->
</header>
<!-- end header -->

<main role="main">
<div id="MyLoader" style=""></div>

<div class="em-l-container" id="IRTContainer" style="display:none">
<div class="em-c-tabs  em-js-tabs em-c-tabs--underline" id="IRTTabs">
  <ul class="em-c-tabs__list">
    <li class="em-c-tabs__item">
	  <a href="#IRTtab-panel-1" class="em-c-tabs__link em-js-tab" >Incident Details</a>
    </li>
    <!-- end em-c-tabs__item -->
    <li class="em-c-tabs__item">
      <a href="#IRTtab-panel-2" class="em-c-tabs__link em-js-tab">Events</a>
    </li>
    <!-- end em-c-tabs__item -->
    <li class="em-c-tabs__item">
      <a href="#IRTtab-panel-3" class="em-c-tabs__link em-js-tab">Objectives</a>
    </li>
    <!-- end em-c-tabs__item -->
    <li class="em-c-tabs__item">
      <a href="#IRTtab-panel-4" class="em-c-tabs__link em-js-tab">Actions</a>
    </li>
    <!-- end em-c-tabs__item -->
    <li class="em-c-tabs__item">
      <a href="#IRTtab-panel-5" class="em-c-tabs__link em-js-tab">Responding Team</a>
    </li>
    <!-- end em-c-tabs__item -->
	<li class="em-c-tabs__item">
      <a href="#IRTtab-panel-6" class="em-c-tabs__link em-js-tab">Incident Summary</a>
    </li>
	<li class="em-c-tabs__item">
      <a href="#IRTtab-panel-7" class="em-c-tabs__link em-js-tab">Key Documents</a>
    </li>
    <!-- end em-c-tabs__item -->
  </ul>
  <!-- end em-c-tabs__list -->
  <div class="em-c-tabs__body em-u-padding-top-none">
    <div class="em-c-tabs__panel em-js-tabs-panel " id="IRTtab-panel-1">
	  <table class="em-c-table " ID="IRTInfoTable">
      <thead class="em-c-table__header">
        <tr class="em-c-table__header-row">
		  <th scope="col" class="em-c-table__header-cell ">Incident Information</th>
		  <th scope="col" class="em-c-table__header-cell ">Business Impact</th>
		  <th scope="col" class="em-c-table__header-cell align='centre'">Status</th>
		  <th scope="col" class="em-c-table__header-cell " align='centre'>Edit</th>
        </tr>   
	  </thead>
	  </table>
	  <table class="em-c-table" ID="IRTDetailsTable">
      <thead class="em-c-table__header">
        <tr class="em-c-table__header-row">
          <th scope="col" class="em-c-table__header-cell ">Incident Start</th>
		  <th scope="col" class="em-c-table__header-cell ">Incident End</th>
		  <th scope="col" class="em-c-table__header-cell ">TimeZone</th>
          <th scope="col" class="em-c-table__header-cell align='left'">Alerted By</th>
		  <th scope="col" class="em-c-table__header-cell align='left'">RBU</th>
		  <th scope="col" class="em-c-table__header-cell align='left'">Functions</th>
		  <th scope="col" class="em-c-table__header-cell align='left'">Countries</th>
		  <th scope="col" class="em-c-table__header-cell align='left'">Vendors</th>
        </tr>
	  </thead>
	  </table>
	  <table class="em-c-table " ID="IRTRootCauseTable">
      <thead class="em-c-table__header">
        <tr class="em-c-table__header-row">
		  <th scope="col" class="em-c-table__header-cell ">Root Cause</th>
		  <th scope="col" class="em-c-table__header-cell ">Lessons Learned</th>
        </tr>
      </thead>
	  </table>
    </div>
	
    <div class="em-c-tabs__panel em-js-tabs-panel" id="IRTtab-panel-2">
     <div class="em-c-table-object ">
  <div class="em-c-table-object__header">
    <div class="em-c-collapsible-toolbar em-js-collapsible-toolbar">
      <button class="em-c-btn em-c-btn--small em-c-btn--bare em-c-btn--toolbar em-js-toolbar-trigger">
        <div class="em-c-btn__inner">
          <span class="em-c-btn__text">Filters</span>
          <svg class="em-c-icon em-c-icon--small em-c-btn__icon em-c-btn__icon-only">
            <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="/sites/FMRE012/SiteAssets/unity-1.3.0/images/em-icons.svg#caret-down"></use>
          </svg>
        </div>
      </button>
      <!-- end em-c-btn -->
      <div class="em-c-collapsible-toolbar__panel em-js-toolbar-panel">
        <div class="em-c-toolbar ">
          <div class="em-c-toolbar__item ">
                <div class="em-c-toggle" id="togEventType" >
      <input class="em-c-toggle__input em-u-is-vishidden" type="radio" value="ALL"  id="Event_ALL" name="toggleEventsType" checked onclick="FilterEvents()" />
      <label class="em-c-toggle__label" for="Event_ALL">
      ALL
      </label>
	  <input class="em-c-toggle__input em-u-is-vishidden" type="radio" value="Key Fact"  id="Event_KeyFact" name="toggleEventsType" onclick="FilterEvents()" />
      <label class="em-c-toggle__label" for="Event_KeyFact">
      Key Facts
      </label>
      <input class="em-c-toggle__input em-u-is-vishidden" type="radio" value="IntComm"  id="Event_IntComm" name="toggleEventsType" onclick="FilterEvents()" />
      <label class="em-c-toggle__label" for="Event_IntComm">
      Internal Communications
      </label>
	  <input class="em-c-toggle__input em-u-is-vishidden" type="radio" value="ExtComm"  id="Event_ExtComm" name="toggleEventsType" onclick="FilterEvents()" />
      <label class="em-c-toggle__label" for="Event_ExtComm">
      External Communications
      </label>
    </div>
    <!-- end em-c-toggle -->
          </div>
          <!-- end em-c-toolbar__item -->
        </div>
        <!-- end em-c-toolbar -->
      </div>
      <!-- End em-c-collapsible-toolbar__panel -->
    </div>
    <!-- End em-c-collapsible-toolbar -->
  </div>
  <!--end em-c-table-object__header-->
  <div class="em-c-table-object__body">
    <div class="em-c-table-object__body-inner">
	 <table class="em-c-table em-c-table--condensed sortable" ID="IRTEventsTable">
      <thead class="em-c-table__header">
        <tr class="em-c-table__header-row">
		  <th scope="col" class="em-c-table__header-cell ">Event</th>
          <th scope="col" class="em-c-table__header-cell ">When</th>
		  <th scope="col" class="em-c-table__header-cell ">Time Zone</th>
		  <th scope="col" class="em-c-table__header-cell ">Contact</th>
		  <th scope="col" class="em-c-table__header-cell ">Key Fact</th>
		  <th scope="col" class="em-c-table__header-cell ">Internal Comm.</th>
		  <th scope="col" class="em-c-table__header-cell ">External Comm.</th>
		  <th scope="col" class="em-c-table__header-cell ">Edit</th>
		  <th scope="col" class="em-c-table__header-cell ">Delete</th>
        </tr>
      </thead>
	  <tbody class="em-c-table__body ">
	  </tbody>
    </table>
	</div>
    <!--end em-c-table-object__body-inner-->
  </div>
  <!--end em-c-table-object__body-->
</div>
<!--end em-c-table-object-->
    </div>
	
    <div class="em-c-tabs__panel em-js-tabs-panel" id="IRTtab-panel-3">
      <div class="em-c-table-object ">
  <div class="em-c-table-object__header">
	   <div class="em-c-collapsible-toolbar em-js-collapsible-toolbar">
      <button class="em-c-btn em-c-btn--small em-c-btn--bare em-c-btn--toolbar em-js-toolbar-trigger">
        <div class="em-c-btn__inner">
          <span class="em-c-btn__text">Filters</span>
          <svg class="em-c-icon em-c-icon--small em-c-btn__icon em-c-btn__icon-only">
            <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="/sites/FMRE012/SiteAssets/unity-1.3.0/images/em-icons.svg#caret-down"></use>
          </svg>
        </div>
      </button>
      <!-- end em-c-btn -->
      <div class="em-c-collapsible-toolbar__panel em-js-toolbar-panel">
        <div class="em-c-toolbar ">
         <div class="em-c-toolbar__item ">
            <div class="em-c-dropdown-check em-js-dropdown-check">
              <button class="em-c-btn em-c-btn--small em-c-btn--is-dropdown em-js-dropdown-trigger">
                <div class="em-c-btn__inner">
                  <span class="em-c-btn__text">Priority</span>
                  <svg class="em-c-icon em-c-icon--small em-c-btn__icon em-c-btn__icon-only">
                    <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="/sites/FMRE012/SiteAssets/unity-1.3.0/images/em-icons.svg#caret-down"></use>
                  </svg>
                </div>
              </button>
              <!-- end em-c-btn -->
              <div class="em-c-dropdown-check__panel">
                <ul class="em-c-dropdown-check__list">
                  <li class="em-c-dropdown-check__item">
                    <label class="em-c-input-group " for="FilterObjPriority-1">
                      <input id="FilterObjPriority-1" type="checkbox" name="" value="High" class="em-c-input-group__control" checked>
                      <span class="em-c-input-group__text">High</span>
                    </label>
                    <!-- end em-c-input-group -->
                  </li>
                  <li class="em-c-dropdown-check__item">
                    <label class="em-c-input-group " for="FilterObjPriority-2">
                      <input id="FilterObjPriority-2" type="checkbox" name="" value="Medium" class="em-c-input-group__control" checked>
                      <span class="em-c-input-group__text">Medium</span>
                    </label>
                    <!-- end em-c-input-group -->
                  </li>
                  <li class="em-c-dropdown-check__item">
                    <label class="em-c-input-group " for="FilterObjPriority-3">
                      <input id="FilterObjPriority-3" type="checkbox" name="" value="Low" class="em-c-input-group__control" checked>
                      <span class="em-c-input-group__text">Low</span>
                    </label>
                    <!-- end em-c-input-group -->
                  </li>
                </ul>
              </div>
              <!-- End em-c-dropdown-check__panel -->
            </div>
            <!-- End em-c-dropdown-check -->
          </div>
          <!-- end em-c-toolbar__item -->
		   <div class="em-c-toolbar__item ">
            <div class="em-c-dropdown-check em-js-dropdown-check">
              <button class="em-c-btn em-c-btn--small em-c-btn--is-dropdown em-js-dropdown-trigger">
                <div class="em-c-btn__inner">
                  <span class="em-c-btn__text">Goal</span>
                  <svg class="em-c-icon em-c-icon--small em-c-btn__icon em-c-btn__icon-only">
                    <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="/sites/FMRE012/SiteAssets/unity-1.3.0/images/em-icons.svg#caret-down"></use>
                  </svg>
                </div>
              </button>
              <!-- end em-c-btn -->
              <div class="em-c-dropdown-check__panel">
                <ul class="em-c-dropdown-check__list">
                  <li class="em-c-dropdown-check__item">
                    <label class="em-c-input-group " for="FilterObjGoal-1">
                      <input id="FilterObjGoal-1" type="checkbox" name="" value="Control the Source" class="em-c-input-group__control" checked>
                      <span class="em-c-input-group__text">Control the Source</span>
                    </label>
                    <!-- end em-c-input-group -->
                  </li>
                  <li class="em-c-dropdown-check__item">
                    <label class="em-c-input-group " for="FilterObjGoal-2">
                      <input id="FilterObjGoal-2" type="checkbox" name="" value="Manage the Response" class="em-c-input-group__control" checked>
                      <span class="em-c-input-group__text">Manage the Response</span>
                    </label>
                    <!-- end em-c-input-group -->
                  </li>
                </ul>
              </div>
              <!-- End em-c-dropdown-check__panel -->
            </div>
            <!-- End em-c-dropdown-check -->
          </div>
          <!-- end em-c-toolbar__item -->
		           <div class="em-c-toolbar__item ">
            <div class="em-c-dropdown-check em-js-dropdown-check">
              <button class="em-c-btn em-c-btn--small em-c-btn--is-dropdown em-js-dropdown-trigger">
                <div class="em-c-btn__inner">
                  <span class="em-c-btn__text">Status</span>
                  <svg class="em-c-icon em-c-icon--small em-c-btn__icon em-c-btn__icon-only">
                    <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="/sites/FMRE012/SiteAssets/unity-1.3.0/images/em-icons.svg#caret-down"></use>
                  </svg>
                </div>
              </button>
              <!-- end em-c-btn -->
              <div class="em-c-dropdown-check__panel">
                <ul class="em-c-dropdown-check__list">
                  <li class="em-c-dropdown-check__item">
                    <label class="em-c-input-group " for="FilterObjStatus-1">
                      <input id="FilterObjStatus-1" type="checkbox" name="" value="Not Started" class="em-c-input-group__control" checked>
                      <span class="em-c-input-group__text">Not Started</span>
                    </label>
                    <!-- end em-c-input-group -->
                  </li>
                  <li class="em-c-dropdown-check__item">
                    <label class="em-c-input-group " for="FilterObjStatus-2">
                      <input id="FilterObjStatus-2" type="checkbox" name="" value="In Progress" class="em-c-input-group__control" checked>
                      <span class="em-c-input-group__text">In Progress</span>
                    </label>
                    <!-- end em-c-input-group -->
                  </li>
                  <li class="em-c-dropdown-check__item">
                    <label class="em-c-input-group " for="FilterObjStatus-3">
                      <input id="FilterObjStatus-3" type="checkbox" name="" value="Completed" class="em-c-input-group__control" checked>
                      <span class="em-c-input-group__text">Completed</span>
                    </label>
                    <!-- end em-c-input-group -->
                  </li>
                </ul>
              </div>
              <!-- End em-c-dropdown-check__panel -->
            </div>
            <!-- End em-c-dropdown-check -->
          </div>
          <!-- end em-c-toolbar__item -->

        </div>
        <!-- end em-c-toolbar -->
      </div>
      <!-- End em-c-collapsible-toolbar__panel -->
    </div>
    <!-- End em-c-collapsible-toolbar -->
  </div>
  <div class="em-c-table-object__body">
    <div class="em-c-table-object__body-inner">
  <table class="em-c-table sortable" ID="IRTObjectivesTable">
      <thead class="em-c-table__header">
        <tr class="em-c-table__header-row">
          <th scope="col" class="em-c-table__header-cell ">Objective</th>
          <th scope="col" class="em-c-table__header-cell em-u-text-align-center">Priority</th>
		  <th scope="col" class="em-c-table__header-cell em-u-text-align-center">Tactics</th>
		  <th scope="col" class="em-c-table__header-cell em-u-text-align-center">Goal</th>
		  <th scope="col" class="em-c-table__header-cell em-u-text-align-center">Status</th>
		  <th scope="col" class="em-c-table__header-cell em-u-text-align-center">Edit</th>
		  <th scope="col" class="em-c-table__header-cell ">Delete</th>
        </tr>
      </thead>
	  <tbody class="em-c-table__body ">
	  </tbody>
    </table>
    </div>
   </div>
   </div>
   </div>
   
    <div class="em-c-tabs__panel em-js-tabs-panel" id="IRTtab-panel-4">
	     <div class="em-c-table-object ">
  <div class="em-c-table-object__header">
	   <div class="em-c-collapsible-toolbar em-js-collapsible-toolbar">
      <button class="em-c-btn em-c-btn--small em-c-btn--bare em-c-btn--toolbar em-js-toolbar-trigger">
        <div class="em-c-btn__inner">
          <span class="em-c-btn__text">Filters</span>
          <svg class="em-c-icon em-c-icon--small em-c-btn__icon em-c-btn__icon-only">
            <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="/sites/FMRE012/SiteAssets/unity-1.3.0/images/em-icons.svg#caret-down"></use>
          </svg>
        </div>
      </button>
      <!-- end em-c-btn -->
      <div class="em-c-collapsible-toolbar__panel em-js-toolbar-panel">
        <div class="em-c-toolbar ">
         <div class="em-c-toolbar__item ">
            <div class="em-c-dropdown-check em-js-dropdown-check">
              <button class="em-c-btn em-c-btn--small em-c-btn--is-dropdown em-js-dropdown-trigger">
                <div class="em-c-btn__inner">
                  <span class="em-c-btn__text">Priority</span>
                  <svg class="em-c-icon em-c-icon--small em-c-btn__icon em-c-btn__icon-only">
                    <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="/sites/FMRE012/SiteAssets/unity-1.3.0/images/em-icons.svg#caret-down"></use>
                  </svg>
                </div>
              </button>
              <!-- end em-c-btn -->
              <div class="em-c-dropdown-check__panel">
                <ul class="em-c-dropdown-check__list">
                  <li class="em-c-dropdown-check__item">
                    <label class="em-c-input-group " for="FilterActionsPriority-1">
                      <input id="FilterActionsPriority-1" type="checkbox" name="" value="High" class="em-c-input-group__control" checked>
                      <span class="em-c-input-group__text">High</span>
                    </label>
                    <!-- end em-c-input-group -->
                  </li>
                  <li class="em-c-dropdown-check__item">
                    <label class="em-c-input-group " for="FilterActionsPriority-2">
                      <input id="FilterActionsPriority-2" type="checkbox" name="" value="Medium" class="em-c-input-group__control" checked>
                      <span class="em-c-input-group__text">Medium</span>
                    </label>
                    <!-- end em-c-input-group -->
                  </li>
                  <li class="em-c-dropdown-check__item">
                    <label class="em-c-input-group " for="FilterActionsPriority-3">
                      <input id="FilterActionsPriority-3" type="checkbox" name="" value="Low" class="em-c-input-group__control" checked>
                      <span class="em-c-input-group__text">Low</span>
                    </label>
                    <!-- end em-c-input-group -->
                  </li>
                </ul>
              </div>
              <!-- End em-c-dropdown-check__panel -->
            </div>
            <!-- End em-c-dropdown-check -->
          </div>
          <!-- end em-c-toolbar__item -->
		           <div class="em-c-toolbar__item ">
            <div class="em-c-dropdown-check em-js-dropdown-check">
              <button class="em-c-btn em-c-btn--small em-c-btn--is-dropdown em-js-dropdown-trigger">
                <div class="em-c-btn__inner">
                  <span class="em-c-btn__text">Status</span>
                  <svg class="em-c-icon em-c-icon--small em-c-btn__icon em-c-btn__icon-only">
                    <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="/sites/FMRE012/SiteAssets/unity-1.3.0/images/em-icons.svg#caret-down"></use>
                  </svg>
                </div>
              </button>
              <!-- end em-c-btn -->
              <div class="em-c-dropdown-check__panel">
                <ul class="em-c-dropdown-check__list">
                  <li class="em-c-dropdown-check__item">
                    <label class="em-c-input-group " for="FilterActionsStatus-1">
                      <input id="FilterActionsStatus-1" type="checkbox" name="" value="Not Started" class="em-c-input-group__control" checked>
                      <span class="em-c-input-group__text">Not Started</span>
                    </label>
                    <!-- end em-c-input-group -->
                  </li>
                  <li class="em-c-dropdown-check__item">
                    <label class="em-c-input-group " for="FilterActionsStatus-2">
                      <input id="FilterActionsStatus-2" type="checkbox" name="" value="In Progress" class="em-c-input-group__control" checked>
                      <span class="em-c-input-group__text">In Progress</span>
                    </label>
                    <!-- end em-c-input-group -->
                  </li>
                  <li class="em-c-dropdown-check__item">
                    <label class="em-c-input-group " for="FilterActionsStatus-3">
                      <input id="FilterActionsStatus-3" type="checkbox" name="" value="Completed" class="em-c-input-group__control" checked>
                      <span class="em-c-input-group__text">Completed</span>
                    </label>
                    <!-- end em-c-input-group -->
                  </li>
                </ul>
              </div>
              <!-- End em-c-dropdown-check__panel -->
            </div>
            <!-- End em-c-dropdown-check -->
          </div>
          <!-- end em-c-toolbar__item -->
	<div class="em-c-toolbar__item em-is-aligned-right">
	      <button class="em-c-btn em-c-btn--small em-js-btn-selectable" onclick="exportTableToExcel('IRTActionsTable', 'IRTActions');">
  <div class="em-c-btn__inner">
    <svg class="em-c-icon em-c-icon--small em-c-btn__icon " data-em-icon-path="/sites/FMRE012/Apps/Scripts/unity-1.7.0/images/em-icons.svg">
      <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="/sites/FMRE012/Apps/Scripts/unity-1.7.0/images/em-icons.svg#download"></use>
    </svg>
    <span class="em-c-btn__text">Download List</span>
  </div>
</button>
</div>
        </div>
        <!-- end em-c-toolbar -->
      </div>
      <!-- End em-c-collapsible-toolbar__panel -->
    </div>
    <!-- End em-c-collapsible-toolbar -->
  </div>
  <div class="em-c-table-object__body">
    <div class="em-c-table-object__body-inner">
      <table class="em-c-table em-c-table--condensed sortable" ID="IRTActionsTable">
      <thead class="em-c-table__header">
        <tr class="em-c-table__header-row">
          <th scope="col" class="em-c-table__header-cell ">Action</th>
          <th scope="col" class="em-c-table__header-cell em-u-text-align-center">Assigned To</th>
		  <th scope="col" class="em-c-table__header-cell em-u-text-align-center">Priority</th>
		  <th scope="col" class="em-c-table__header-cell em-u-text-align-center">Start Date</th>
		  <th scope="col" class="em-c-table__header-cell em-u-text-align-center">Due Date</th>
		  <th scope="col" class="em-c-table__header-cell em-u-text-align-center">Time Zone</th>
		  <th scope="col" class="em-c-table__header-cell em-u-text-align-center">Notes</th>
		  <th scope="col" class="em-c-table__header-cell em-u-text-align-center">Status</th>
		  <th scope="col" class="em-c-table__header-cell em-u-text-align-center">Edit</th>
		  <th scope="col" class="em-c-table__header-cell ">Delete</th>
        </tr>
      </thead>
	  <tbody class="em-c-table__body ">
	  </tbody>
    </table>
    </div>
   </div>
   </div>
   </div>

	
    <div class="em-c-tabs__panel em-js-tabs-panel" id="IRTtab-panel-5">
	  <div class="em-c-table-object  ">
		<div class="em-c-table-object__header">
		</div>
  <!--end em-c-table-object__header-->
  <div class="em-c-table-object__body">
    <div class="em-c-table-object__body-inner">
      <table class="em-c-table em-u-width-50 sortable " id="IRTRespondingTeamTable">
        <thead class="em-c-table__header">
          <tr class="em-c-table__header-row">
            <th scope="col" class="em-c-table__header-cell ">Position</th>
            <th scope="col" class="em-c-table__header-cell ">Contact</th>
            <th scope="col" class="em-c-table__header-cell ">Skype</th>
            <th scope="col" class="em-c-table__header-cell ">Email</th>
			<th scope="col" class="em-c-table__header-cell ">Edit</th>
			<th scope="col" class="em-c-table__header-cell ">Delete</th>
          </tr>
          <!-- em-c-table__header-row -->
		  </thead>
        <!-- end em-c-table__header -->
		  <tbody class="em-c-table__body ">
		  </tbody>
      </table>
      <!--end em-c-table-->
    </div>
    <!--end em-c-table-object__body-inner-->
  </div>
  <!--end em-c-table-object__body-->
</div>
<!--end em-c-table-object-->
  </div>
	
	<div class="em-c-tabs__panel em-js-tabs-panel" id="IRTtab-panel-6">
<h3>Incident Details</h3>
	  <table class="em-c-table em-c-table--condensed " ID="SummaryDetailsTable">
      <thead class="em-c-table__header">
        <tr class="em-c-table__header-row" bgcolor="#0c69b0">
		  <th scope="col" class="em-c-table__header-cell " align='centre'>Information</th>
		  <th scope="col" class="em-c-table__header-cell ">RBU</th>
		  <th scope="col" class="em-c-table__header-cell align='centre'">Countries</th>
		  <th scope="col" class="em-c-table__header-cell " align='centre'>Vendors</th>
		  <th scope="col" class="em-c-table__header-cell " align='centre'>Alerted By</th>
        </tr>   
	  </thead>
	  </table>
<div><h3>Internal Communication  </h3></div>
	  <table class="em-c-table em-c-table--condensed " ID="SummaryIntCommTable">
      <thead class="em-c-table__header">
        <tr class="em-c-table__header-row" bgcolor="#0c69b0">
		  <th scope="col" class="em-c-table__header-cell ">Title</th>
		  <th scope="col" class="em-c-table__header-cell ">When</th>
		  <th scope="col" class="em-c-table__header-cell align='centre'">Time Zone</th>
		  <th scope="col" class="em-c-table__header-cell " align='centre'>Contact</th>
        </tr>   
	  </thead>
	  </table>
<div><h3>Information  </h3><h6>(Key Facts)</h6></div>
	  <table class="em-c-table em-c-table--condensed " ID="SummaryInfoTable">
      <thead class="em-c-table__header">
        <tr class="em-c-table__header-row" bgcolor="#0c69b0">
		  <th scope="col" class="em-c-table__header-cell ">Title</th>
		  <th scope="col" class="em-c-table__header-cell ">When</th>
		  <th scope="col" class="em-c-table__header-cell align='centre'">Time Zone</th>
		  <th scope="col" class="em-c-table__header-cell " align='centre'>Contact</th>
        </tr>   
	  </thead>
	  </table>
<h3>Objectives  </h3><h6>(High Priority only)</h6>
	  <table class="em-c-table em-c-table--condensed " ID="SummaryObjTable">
      <thead class="em-c-table__header">
        <tr class="em-c-table__header-row" bgcolor="#0c69b0">
		  <th scope="col" class="em-c-table__header-cell ">Objective</th>
		  <th scope="col" class="em-c-table__header-cell ">Tactics</th>
		  <th scope="col" class="em-c-table__header-cell align='centre'">Goal</th>
		  <th scope="col" class="em-c-table__header-cell " align='centre'>Status</th>
        </tr>   
	  </thead>
	  </table>
<div><h3>Planned Actions  </h3><h6>(High Priority only)</h6></div>
	  <table class="em-c-table em-c-table--condensed " ID="SummaryActionTable">
      <thead class="em-c-table__header">
        <tr class="em-c-table__header-row" bgcolor="#0c69b0">
		  <th scope="col" class="em-c-table__header-cell ">Action</th>
		  <th scope="col" class="em-c-table__header-cell ">Assigned To</th>
		  <th scope="col" class="em-c-table__header-cell align='centre'">Start Date</th>
		  <th scope="col" class="em-c-table__header-cell align='centre'">Due Date</th>
		  <th scope="col" class="em-c-table__header-cell align='centre'">Time Zone</th>
		  <th scope="col" class="em-c-table__header-cell " align='centre'>Status</th>
        </tr>   
	  </thead>
	  </table>
<div><h3>Current Organization  </h3><h6>(Responding Team)</h6></div>
	  <table class="em-c-table em-c-table--condensed " ID="SummaryTeamTable">
      <thead class="em-c-table__header">
        <tr class="em-c-table__header-row" bgcolor="#0c69b0">
		  <th scope="col" class="em-c-table__header-cell ">Position</th>
		  <th scope="col" class="em-c-table__header-cell ">Contact</th>		  
        </tr>   
	  </thead>
	  </table>
<h3>Communication  </h3><h6>(External)</h6>
	  <table class="em-c-table em-c-table--condensed " ID="SummaryExtCommTable">
      <thead class="em-c-table__header">
        <tr class="em-c-table__header-row" bgcolor="#0c69b0">
		  <th scope="col" class="em-c-table__header-cell ">Title</th>
		  <th scope="col" class="em-c-table__header-cell ">When</th>
		  <th scope="col" class="em-c-table__header-cell align='centre'">Time Zone</th>
		  <th scope="col" class="em-c-table__header-cell " align='centre'>Contact</th>
        </tr>   
	  </thead>
	  </table>
<h3>Supporting Documentation</h3>
<br/>
<a href="" target="_blank" id="DocsLink3"><p>Click here to view the Incident Key Documents (will open in new window)</p></a>
</div>
	
	<div class="em-c-tabs__panel em-js-tabs-panel" id="IRTtab-panel-7">
	  <div class="em-c-table-object  ">
		<div class="em-c-table-object__header">
		</div>
  <!--end em-c-table-object__header-->
  <div class="em-c-table-object__body">
    <div class="em-c-table-object__body-inner">
      <table class="em-c-table  sortable " id="IRTKeyDocsTable">
        <thead class="em-c-table__header">
          <tr class="em-c-table__header-row">
            <th scope="col" class="em-c-table__header-cell ">View</th>
            <th scope="col" class="em-c-table__header-cell ">Name</th>
            <th scope="col" class="em-c-table__header-cell ">Related To</th>
            <th scope="col" class="em-c-table__header-cell ">Keywords</th>
			<th scope="col" class="em-c-table__header-cell ">Modified</th>
			<th scope="col" class="em-c-table__header-cell ">Modified By</th>
          </tr>
          <!-- em-c-table__header-row -->
		  </thead>
        <!-- end em-c-table__header -->
		  <tbody class="em-c-table__body ">
		  </tbody>
      </table>
      <!--end em-c-table-->
    </div>
    <!--end em-c-table-object__body-inner-->
  </div>
  <!--end em-c-table-object__body-->
</div>
<!--end em-c-table-object-->
 
  </div>
  </div>
  <!-- end tabs body -->
</div>
<!-- end IRT tabs -->
</div>
<!-- end IRT container -->

<div class="em-l-container" id="ESGContainer" style="display:none">
<div class="em-c-tabs  em-js-tabs em-c-tabs--underline" id="ESGTabs">
  <ul class="em-c-tabs__list">
    <li class="em-c-tabs__item">
      <a href="#ESGtab-panel-1" class="em-c-tabs__link em-js-tab">Incident Details</a>
    </li>
    <!-- end em-c-tabs__item -->
    <li class="em-c-tabs__item">
      <a href="#ESGtab-panel-2" class="em-c-tabs__link em-js-tab">Events</a>
    </li>
    <!-- end em-c-tabs__item -->
    <li class="em-c-tabs__item">
      <a href="#ESGtab-panel-3" class="em-c-tabs__link em-js-tab">Objectives</a>
    </li>
    <!-- end em-c-tabs__item -->
	<li class="em-c-tabs__item">
      <a href="#ESGtab-panel-4" class="em-c-tabs__link em-js-tab">Actions</a>
    </li>
    <!-- end em-c-tabs__item -->
    <li class="em-c-tabs__item">
      <a href="#ESGtab-panel-5" class="em-c-tabs__link em-js-tab">Worst Case Scenario</a>
    </li>
    <!-- end em-c-tabs__item -->
	<li class="em-c-tabs__item">
      <a href="#ESGtab-panel-6" class="em-c-tabs__link em-js-tab">Responding Team</a>
    </li>
    <!-- end em-c-tabs__item -->
	<li class="em-c-tabs__item">
      <a href="#ESGtab-panel-7" class="em-c-tabs__link em-js-tab">Incident Summary</a>
    </li>
    <!-- end em-c-tabs__item -->
	<li class="em-c-tabs__item">
      <a href="#ESGtab-panel-8" class="em-c-tabs__link em-js-tab">Key Documents</a>
    </li>
    <!-- end em-c-tabs__item -->
  </ul>
  <!-- end em-c-tabs__list -->
  <div class="em-c-tabs__body em-u-padding-top-none" >
    <div class="em-c-tabs__panel em-js-tabs-panel" id="ESGtab-panel-1">
     <table class="em-c-table " ID="ESGInfoTable">
      <thead class="em-c-table__header">
        <tr class="em-c-table__header-row">
		  <th scope="col" class="em-c-table__header-cell ">Incident Information</th>
		  <th scope="col" class="em-c-table__header-cell ">Business Impact</th>
		  <th scope="col" class="em-c-table__header-cell align='centre'">Status</th>
		  <th scope="col" class="em-c-table__header-cell align='centre'">Edit</th>
        </tr>   
	  </thead>
	  </table>
	  <table class="em-c-table" ID="ESGDetailsTable">
      <thead class="em-c-table__header">
        <tr class="em-c-table__header-row">
          <th scope="col" class="em-c-table__header-cell ">Incident Start</th>
		  <th scope="col" class="em-c-table__header-cell ">Incident End</th>
		  <th scope="col" class="em-c-table__header-cell ">TimeZone</th>
          <th scope="col" class="em-c-table__header-cell align='left'">Alerted By</th>
		  <th scope="col" class="em-c-table__header-cell align='left'">RBU</th>
		  <th scope="col" class="em-c-table__header-cell align='left'">Functions</th>
		  <th scope="col" class="em-c-table__header-cell align='left'">Countries</th>
		  <th scope="col" class="em-c-table__header-cell align='left'">Vendors</th>
		  
        </tr>
	  </thead>
	  </table>
	  <table class="em-c-table " ID="ESGRootCauseTable">
      <thead class="em-c-table__header">
        <tr class="em-c-table__header-row">
		  <th scope="col" class="em-c-table__header-cell ">Root Cause</th>
		  <th scope="col" class="em-c-table__header-cell ">Lessons Learned</th>
        </tr>
      </thead>
	  </table>
	</div>
	
    <div class="em-c-tabs__panel em-js-tabs-panel" id="ESGtab-panel-2">
     <table class="em-c-table sortable " ID="ESGEventsTable">
      <thead class="em-c-table__header">
        <tr class="em-c-table__header-row">
          <th scope="col" class="em-c-table__header-cell ">Event</th>
          <th scope="col" class="em-c-table__header-cell ">When</th>
		  <th scope="col" class="em-c-table__header-cell ">Time Zone</th>
		  <th scope="col" class="em-c-table__header-cell ">Contact</th>
		  <th scope="col" class="em-c-table__header-cell ">Key Fact</th>
		  <th scope="col" class="em-c-table__header-cell ">Internal Comm.</th>
		  <th scope="col" class="em-c-table__header-cell ">External Comm.</th>
		  <th scope="col" class="em-c-table__header-cell ">Edit</th>
		  <th scope="col" class="em-c-table__header-cell ">Delete</th>
        </tr>
      </thead>
	  <tbody class="em-c-table__body ">
	  </tbody>
    </table>
    </div>
	
    <div class="em-c-tabs__panel em-js-tabs-panel" id="ESGtab-panel-3">
      <table class="em-c-table sortable" ID="ESGObjectivesTable">
      <thead class="em-c-table__header">
        <tr class="em-c-table__header-row">
          <th scope="col" class="em-c-table__header-cell ">PEAR</th>
		  <th scope="col" class="em-c-table__header-cell em-u-text-align-center">Objective</th>
          <th scope="col" class="em-c-table__header-cell em-u-text-align-center">Priority</th>
		  <th scope="col" class="em-c-table__header-cell em-u-text-align-center">Tactics</th>
		  <th scope="col" class="em-c-table__header-cell em-u-text-align-center">Goal</th>
		  <th scope="col" class="em-c-table__header-cell em-u-text-align-center">Status</th>
		  <th scope="col" class="em-c-table__header-cell em-u-text-align-center">Edit</th>
		  <th scope="col" class="em-c-table__header-cell ">Delete</th>
        </tr>
      </thead>
	  <tbody class="em-c-table__body ">
	  </tbody>
    </table>
    </div>
	
	<div class="em-c-tabs__panel em-js-tabs-panel" id="ESGtab-panel-4">
      <table class="em-c-table sortable" ID="ESGActionsTable">
      <thead class="em-c-table__header">
        <tr class="em-c-table__header-row">
          <th scope="col" class="em-c-table__header-cell ">Action</th>
          <th scope="col" class="em-c-table__header-cell em-u-text-align-center">Assigned To</th>
		  <th scope="col" class="em-c-table__header-cell em-u-text-align-center">Priority</th>
		  <th scope="col" class="em-c-table__header-cell em-u-text-align-center">Start Date</th>
		  <th scope="col" class="em-c-table__header-cell em-u-text-align-center">Due Date</th>
		  <th scope="col" class="em-c-table__header-cell em-u-text-align-center">Time Zone</th>
		  <th scope="col" class="em-c-table__header-cell em-u-text-align-center">Notes</th>
		  <th scope="col" class="em-c-table__header-cell em-u-text-align-center">Status</th>
		  <th scope="col" class="em-c-table__header-cell em-u-text-align-center">Edit</th>
		  <th scope="col" class="em-c-table__header-cell ">Delete</th>
        </tr>
      </thead>
	  <tbody class="em-c-table__body ">
	  </tbody>
    </table>
    </div>
	
    <div class="em-c-tabs__panel em-js-tabs-panel" id="ESGtab-panel-5">
      <table class="em-c-table sortable" ID="ESGWCSTable">
      <thead class="em-c-table__header">
        <tr class="em-c-table__header-row">
          <th scope="col" class="em-c-table__header-cell ">PEAR</th>
          <th scope="col" class="em-c-table__header-cell ">Scenario</th>
		  <th scope="col" class="em-c-table__header-cell ">Impact</th>
		  <th scope="col" class="em-c-table__header-cell ">Probability</th>
		  <th scope="col" class="em-c-table__header-cell ">Edit</th>
		  <th scope="col" class="em-c-table__header-cell ">Delete</th>
        </tr>
      </thead>
	  <tbody class="em-c-table__body ">
	  </tbody>
    </table>
    </div>

	<div class="em-c-tabs__panel em-js-tabs-panel" id="ESGtab-panel-6">
 	  <div class="em-c-table-object  ">
			<div class="em-c-table-object__header"></div>
			<div class="em-c-table-object__body">
				<div class="em-c-table-object__body-inner">
	  <table class="em-c-table em-u-width-50 sortable " id="ESGRespondingTeamTable">
			<thead class="em-c-table__header">
          <tr class="em-c-table__header-row">
            <th scope="col" class="em-c-table__header-cell ">Position</th>
            <th scope="col" class="em-c-table__header-cell ">Contact</th>
            <th scope="col" class="em-c-table__header-cell ">Skype</th>
            <th scope="col" class="em-c-table__header-cell ">Email</th>
			<th scope="col" class="em-c-table__header-cell ">Edit</th>
			<th scope="col" class="em-c-table__header-cell ">Delete</th>
          </tr>
          <!-- em-c-table__header-row -->
		  </thead>
        <!-- end em-c-table__header -->
		  <tbody class="em-c-table__body ">
		  </tbody>
      </table>
      <!--end em-c-table-->
    </div>
    <!--end em-c-table-object__body-inner-->
  </div>
  <!--end em-c-table-object__body-->
</div>
<!--end em-c-table-object-->
</div>
	
    <div class="em-c-tabs__panel em-js-tabs-panel" id="ESGtab-panel-7">
	  <h3>Incident Details</h3>
	  <table class="em-c-table em-c-table--condensed " ID="ESGSummaryDetailsTable">
      <thead class="em-c-table__header">
        <tr class="em-c-table__header-row" bgcolor="#0c69b0">
		  <th scope="col" class="em-c-table__header-cell " align='centre'>Information</th>
		  <th scope="col" class="em-c-table__header-cell ">RBU</th>
		  <th scope="col" class="em-c-table__header-cell align='centre'">Countries</th>
		  <th scope="col" class="em-c-table__header-cell " align='centre'>Vendors</th>
		  <th scope="col" class="em-c-table__header-cell " align='centre'>Alerted By</th>
        </tr>   
	  </thead>
	  </table>
<div><h3>Internal Communication  </h3></div>
	  <table class="em-c-table em-c-table--condensed " ID="ESGSummaryIntCommTable">
      <thead class="em-c-table__header">
        <tr class="em-c-table__header-row" bgcolor="#0c69b0">
		  <th scope="col" class="em-c-table__header-cell ">Title</th>
		  <th scope="col" class="em-c-table__header-cell ">When</th>
		  <th scope="col" class="em-c-table__header-cell align='centre'">Time Zone</th>
		  <th scope="col" class="em-c-table__header-cell " align='centre'>Contact</th>
        </tr>   
	  </thead>
	  </table>
<div><h3>Information  </h3><h6>(Key Facts)</h6></div>
	  <table class="em-c-table em-c-table--condensed " ID="ESGSummaryInfoTable">
      <thead class="em-c-table__header">
        <tr class="em-c-table__header-row" bgcolor="#0c69b0">
		  <th scope="col" class="em-c-table__header-cell ">Title</th>
		  <th scope="col" class="em-c-table__header-cell ">When</th>
		  <th scope="col" class="em-c-table__header-cell align='centre'">Time Zone</th>
		  <th scope="col" class="em-c-table__header-cell " align='centre'>Contact</th>
        </tr>   
	  </thead>
	  </table>
<h3>Objectives  </h3><h6>(High Priority only)</h6>
	  <table class="em-c-table em-c-table--condensed " ID="ESGSummaryObjTable">
      <thead class="em-c-table__header">
        <tr class="em-c-table__header-row" bgcolor="#0c69b0">
		  <th scope="col" class="em-c-table__header-cell ">PEAR</th>
		  <th scope="col" class="em-c-table__header-cell ">Objective</th>
		  <th scope="col" class="em-c-table__header-cell ">Tactics</th>
		  <th scope="col" class="em-c-table__header-cell align='centre'">Goal</th>
		  <th scope="col" class="em-c-table__header-cell " align='centre'>Status</th>
        </tr>   
	  </thead>
	  </table>
<div><h3>Planned Actions  </h3><h6>(High Priority only)</h6></div>
	  <table class="em-c-table em-c-table--condensed " ID="ESGSummaryActionTable">
      <thead class="em-c-table__header">
        <tr class="em-c-table__header-row" bgcolor="#0c69b0">
		  <th scope="col" class="em-c-table__header-cell ">Action</th>
		  <th scope="col" class="em-c-table__header-cell ">Assigned To</th>
		  <th scope="col" class="em-c-table__header-cell align='centre'">Start Date</th>
		  <th scope="col" class="em-c-table__header-cell align='centre'">Due Date</th>
		  <th scope="col" class="em-c-table__header-cell align='centre'">Time Zone</th>
		  <th scope="col" class="em-c-table__header-cell " align='centre'>Status</th>
        </tr>   
	  </thead>
	  </table>
<div><h3>Worst Case Scenario </h3></div> 
	  <table class="em-c-table em-c-table--condensed" ID="ESGSummaryWCSTable">
      <thead class="em-c-table__header">
        <tr class="em-c-table__header-row" bgcolor="#0c69b0">
          <th scope="col" class="em-c-table__header-cell ">PEAR</th>
          <th scope="col" class="em-c-table__header-cell ">Scenario</th>
		  <th scope="col" class="em-c-table__header-cell ">Impact</th>
		  <th scope="col" class="em-c-table__header-cell ">Probability</th>
        </tr>
      </thead>
    </table>	
<div><h3>Current Organization  </h3><h6>(Responding Team)</h6></div>
	  <table class="em-c-table em-c-table--condensed " ID="ESGSummaryTeamTable">
      <thead class="em-c-table__header">
        <tr class="em-c-table__header-row" bgcolor="#0c69b0">
		  <th scope="col" class="em-c-table__header-cell ">Position</th>
		  <th scope="col" class="em-c-table__header-cell ">Contact</th>		  
        </tr>   
	  </thead>
	  </table>
<h3>Communication  </h3><h6>(External)</h6>
	  <table class="em-c-table em-c-table--condensed " ID="ESGSummaryExtCommTable">
      <thead class="em-c-table__header">
        <tr class="em-c-table__header-row" bgcolor="#0c69b0">
		  <th scope="col" class="em-c-table__header-cell ">Title</th>
		  <th scope="col" class="em-c-table__header-cell ">When</th>
		  <th scope="col" class="em-c-table__header-cell align='centre'">Time Zone</th>
		  <th scope="col" class="em-c-table__header-cell " align='centre'>Contact</th>
        </tr>   
	  </thead>
	  </table>
<h3>Supporting Documentation</h3>
<br/><br/>
<a href="" target="_blank" id="DocsLink2"><p>Click here to view the Incident Key Documents (will open in new window)</p></a>	  
    </div>
	
	<div class="em-c-tabs__panel em-js-tabs-panel" id="ESGtab-panel-8">
	  <div class="em-c-table-object  ">
		<div class="em-c-table-object__header">
		</div>
  <!--end em-c-table-object__header-->
  <div class="em-c-table-object__body">
    <div class="em-c-table-object__body-inner">
      <table class="em-c-table  sortable " id="ESGKeyDocsTable">
        <thead class="em-c-table__header">
          <tr class="em-c-table__header-row">
            <th scope="col" class="em-c-table__header-cell ">View</th>
            <th scope="col" class="em-c-table__header-cell ">Name</th>
            <th scope="col" class="em-c-table__header-cell ">Related To</th>
            <th scope="col" class="em-c-table__header-cell ">Keywords</th>
			<th scope="col" class="em-c-table__header-cell ">Modified</th>
			<th scope="col" class="em-c-table__header-cell ">Modified By</th>
          </tr>
          <!-- em-c-table__header-row -->
		  </thead>
        <!-- end em-c-table__header -->
		  <tbody class="em-c-table__body ">
		  </tbody>
      </table>
      <!--end em-c-table-->
    </div>
    <!--end em-c-table-object__body-inner-->
  </div>
  <!--end em-c-table-object__body-->
</div>
<!--end em-c-table-object-->
	</div>
	
  </div>
  <!-- end tabs body -->
</div>
<!-- end ESG tabs -->
</div>
<!-- end ESG container -->

<!-- FORMS -->
<div class="em-l-container" id="FormsContainer" style="display:none">
<form class="em-js-form" id="IncidentForm" style="border-radius: 20px; padding: 10px; border: 2px solid red;" onsubmit="return false">
<h3 class="em-u-text-align-center" id="IncidentLegend" >LOG A NEW INCIDENT</h3>
<fieldset class="em-c-fieldset">
<div class="em-l-grid em-l-grid--3up ">
		<div class="em-l-grid__item em-u-width-50">
			<div class="em-c-field ">
				<label for="frmIncidentName" class="em-c-field__label">Incident Name</label>
                <div class="em-c-field__body">
                  <input type="" id="frmIncidentName" class="em-c-input" placeholder="(Max Length 40 characters)" value="" maxlength="40" />
                </div>
                <!-- end em-c-field__body -->
                
			</div>
<!-- end em-c-field -->
		</div>
<!-- end em-l-grid__item -->
		<div class="em-l-grid__item em-u-width-20">
			<div class="em-c-field ">
				<label for="frmAlertedBy" class="em-c-field__label">Alerted By</label>
                <div class="em-c-field__body">
                  <input type="" id="frmAlertedBy" class="em-c-input" placeholder="Enter Contact/Source" value="" />
			    </div>
<!-- end em-c-field__body -->
			</div> 
<!-- end em-c-field -->
		</div>
  <!-- end em-l-grid__item -->
		<div class="em-l-grid__item em-u-width-20">
			<div class="em-c-field ">
				<label for="frmIncidentStatus" class="em-c-field__label">Status</label>
					<div class="em-c-field__body">
						<select class="em-c-select em-c-select" id="frmIncidentStatus" placeholder="Placeholder">
						<optgroup label="Option Group">
						<option value="Open">Open</option>
						<option value="Closed">Closed</option>
						</optgroup>
						</select>
					</div>
  <!-- end em-c-field__body -->
			</div>
<!-- end em-c-field -->
		</div>
  <!-- end em-l-grid__item -->
	</div>
<!-- end em-l-grid -->  
<div class="em-l-grid em-l-grid--3up ">
	<div class="em-l-grid__item">
		<div class="em-c-field em-c-field--checkbox">
                <h4 for="RBU" class="em-c-field__label">RBU(s) Affected</h4>
                <div class="em-c-field__body">
                  <ul class="em-c-option-list">
                    <li class="em-c-option-list__item">
                      <label class="em-c-input-group" for="check-1">
                        <input id="RBUcheck-1" type="checkbox" name="frmRBU[]" value="AP" class="em-c-input-group__control em-js-checkbox-trigger" >
                        <span class="em-c-input-group__text">AP</span>
                      </label>
                    </li>
                    <!-- end em-c-checkbox-list__item -->
					<li class="em-c-option-list__item">
                      <label class="em-c-input-group" for="check-1">
                        <input id="RBUcheck-2" type="checkbox" name="frmRBU[]" value="EA" class="em-c-input-group__control em-js-checkbox-trigger" >
                        <span class="em-c-input-group__text">EA</span>
                      </label>
                    </li>
                    <!-- end em-c-checkbox-list__item -->
					<li class="em-c-option-list__item">
                      <label class="em-c-input-group" for="check-1">
                        <input id="RBUcheck-3" type="checkbox" name="frmRBU[]" value="NA" class="em-c-input-group__control em-js-checkbox-trigger" >
                        <span class="em-c-input-group__text">NA</span>
                      </label>
                    </li>
                    <!-- end em-c-checkbox-list__item -->
                  </ul>
                  <!-- end em-c-option-list -->
                </div>
                <!-- end em-c-field__body -->
		</div>
<!--end em-c-field-->
	</div>
<!-- end em-l-grid__item -->
	<div class="em-l-grid__item">
		<div class="em-c-field">
			<label for="frmIncidentDate" class="em-c-field__label">Incident Start Date/Time</label>
			<div class="em-c-field__body">
			<input type="text" name="IncidentDate" id="frmIncidentDate" value="2019/01/01 10:00"> 
				<script type="text/javascript"> 
					$(function(){ 
						$('*[name=IncidentDate]').appendDtpicker({"minuteInterval": 10, "dateFormat": "YYYY-MM-DD hh:mm:00"}); 
					});
					</script> 
			</div>
<!-- end em-c-field__body -->
		</div>
				<div class="em-c-field">
			<label for="frmIncidentEndDate" class="em-c-field__label">Incident End Date/Time</label>
			<div class="em-c-field__body">
			<input type="text" name="IncidentEndDate" id="frmIncidentEndDate" value="2019/01/01 10:00"> 
				<script type="text/javascript"> 
					$(function(){ 
						$('*[name=IncidentEndDate]').appendDtpicker({"minuteInterval": 10, "dateFormat": "YYYY-MM-DD hh:mm:00"}); 
					});
					</script> 
			</div>
<!-- end em-c-field__body -->
		</div>
<!-- end em-c-field-date-picker -->
	</div>
<!-- end em-l-grid__item -->
	<div class="em-l-grid__item">
		<div class="em-c-field">
			<h4 for="" class="em-c-field__label">Time Zone</h4>
			<div class="em-c-field__body">
			<ul class="em-c-option-list ">
				<li class="em-c-option-list__item em-js-radio-trigger-parent">
			<label class="em-c-input-group" for="TZ-1">
			<input id="TZ-1" type="radio" name="frmTZ" value="CST" class="em-c-input-group__control em-js-radio-trigger" >
			<span class="em-c-input-group__text">CST (Houston)</span>
			</label>
				</li>
<!-- end em-c-radio-list__item -->
				<li class="em-c-option-list__item em-js-radio-trigger-parent">
			<label class="em-c-input-group" for="TZ-2">
			<input id="TZ-2" type="radio" name="frmTZ" value="CET" class="em-c-input-group__control em-js-radio-trigger">
			<span class="em-c-input-group__text">CET (Europe)</span>
			</label>
				</li>
<!-- end em-c-radio-list__item -->
				<li class="em-c-option-list__item em-js-radio-trigger-parent">
			<label class="em-c-input-group" for="TZ-3">
			<input id="TZ-3" type="radio" name="frmTZ" value="ICT" class="em-c-input-group__control em-js-radio-trigger">
			<span class="em-c-input-group__text">ICT (Bangkok)</span>
			</label>
				</li>
      <!-- end em-c-radio-list__item -->
			</ul>
    <!-- end em-c-option-list -->
			</div>
  <!-- end em-c-field__body -->
		</div>
<!-- end em-c-field -->
	</div>
  <!-- end em-l-grid__item -->
</div>
<!-- end em-l-grid --> 
<div class="em-l-grid em-l-grid--3up ">
	<div class="em-l-grid__item" id="VendorsGrid">
	<h4 for="Vendors" class="em-c-field__label">Vendor(s) Involved</h4>
 <select multiple name="Vendors" title="Vendors" class="demo " id="Vendors" >
 </select>
	</div>
	<!-- end em-l-grid__item -->
	<div class="em-l-grid__item" id = "CountriesGrid">
<h4 for="Countries" class="em-c-field__label">Countries Affected</h4>
<select multiple name="Countries" title="Countries" class="demo " id="Countries" >
</select>
</div>
<!-- end em-l-grid__item -->
	<div class="em-l-grid__item">
		<div class="em-c-field em-c-field--checkbox">
                <h4 for="Functions" class="em-c-field__label">Function(s) Affected</h4>
                <div class="em-c-field__body">
                  <ul class="em-c-option-list">
                    <li class="em-c-option-list__item">
                      <label class="em-c-input-group" for="Functionscheck-1">
                        <input id="Functionscheck-1" type="checkbox" name="frmFunctions[]" value="Payments" class="em-c-input-group__control em-js-checkbox-trigger" >
                        <span class="em-c-input-group__text">Payments</span>
                      </label>
                    </li>
                    <!-- end em-c-checkbox-list__item -->
					<li class="em-c-option-list__item">
                      <label class="em-c-input-group" for="Functionscheck-2">
                        <input id="Functionscheck-2" type="checkbox" name="frmFunctions[]" value="Loyalty" class="em-c-input-group__control em-js-checkbox-trigger" >
                        <span class="em-c-input-group__text">Loyalty</span>
                      </label>
                    </li>
                    <!-- end em-c-checkbox-list__item -->
                  </ul>
                  <!-- end em-c-option-list -->
                </div>
                <!-- end em-c-field__body -->
                
		</div>
<!--end em-c-field-->
	</div>
<!-- end em-l-grid__item -->
</div>
<!-- end em-l-grid -->
<div class="em-l-grid em-l-grid--3up ">
	<div class="em-l-grid__item">
		<div class="em-c-field ">
                <label for="frmIncidentInfo" class="em-c-field__label">Incident Information</label>
                <div class="em-c-field__body">
                  <textarea class="em-c-textarea " id="frmIncidentInfo" placeholder="What happened?" value="" rows="10" ></textarea>
                </div>
                <!-- end em-c-field__body -->
		</div>
<!-- end em-c-field -->
	</div>
  <!-- end em-l-grid__item -->
	<div class="em-l-grid__item">
		<div class="em-c-field ">
                <label for="frmBusinessImpact" class="em-c-field__label">Business Impact</label>
                <div class="em-c-field__body">
                  <textarea class="em-c-textarea " id="frmBusinessImpact" placeholder="Sites/Customers Impacted, Financial Impact, etc" value="" rows="10"></textarea>
                </div>
                <!-- end em-c-field__body -->
		</div>
<!-- end em-c-field -->
	</div>
  <!-- end em-l-grid__item -->
	<div class="em-l-grid__item">
		<div class="em-c-field em-c-field--file-upload ">
			<label for="file" class="em-c-field__label">Upload File</label>
			<div class="em-c-field__body">
			<svg class="em-c-icon em-c-icon--large em-c-field__block-icon">
			<use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="/sites/FMRE012/SiteAssets/unity-1.3.0/images/48/em-icons.svg#upload"></use>
			</svg>
			<input type="file" name="IncidentFile[]" id="IncidentFile" class="em-c-file-upload" placeholder="Placeholder" value="" multiple />
			<ul class="em-c-field__list em-js-field-list" id="file-list-display">
			<li class="em-c-field__item">Drag files here</li>
			<li class="em-c-field__item em-c-field__item--small">Or click to choose file</li>
			</ul>
			</div>
<!-- end em-c-field__body -->
		</div>
<!-- end em-c-field -->
	</div>
<!-- end em-l-grid-item -->
</div>
<!-- end em-l-grid -->
<div class="em-l-grid em-l-grid--3up ">
	<div class="em-l-grid__item">
		<div class="em-c-field ">
                <label for="frmRootCause" class="em-c-field__label">Root Cause</label>
                <div class="em-c-field__body">
                  <textarea class="em-c-textarea " id="frmRootCause" placeholder="Root Cause required for Incident Closeout" value="" rows="10"></textarea>
                </div>
                <!-- end em-c-field__body -->
		</div>
<!-- end em-c-field -->
	</div>
  <!-- end em-l-grid__item -->
	<div class="em-l-grid__item">
		<div class="em-c-field ">
                <label for="frmLessonsLearned" class="em-c-field__label">Lessons Learned</label>
                <div class="em-c-field__body">
                  <textarea class="em-c-textarea " id="frmLessonsLearned" placeholder="Lessons Learned required for Incident Closeout" value="" rows="10"></textarea>
                </div>
                <!-- end em-c-field__body -->
		</div>
<!-- end em-c-field -->
	</div>
  <!-- end em-l-grid__item -->
	<div class="em-l-grid__item">
		<br/>
		<br/>
		<div class="em-c-btn-group ">
				<button class="submit em-c-btn em-c-btn--primary" id="IncidentSave" onclick="UpdateListItem(IncidentID, 0)">
				  <span class="em-c-btn__text">Submit Incident</span>
                </button>
                <!-- end em-c-btn -->
                <button class="em-c-btn em-c-btn--secondary" id="CancelBtn" onclick="CancelForms()">
                  <span class="em-c-btn__text">Cancel</span>
                </button>
                <!-- end em-c-btn -->
		</div> 
	</div>
<!-- end em-l-grid-item -->
</div>
<!-- end em-l-grid -->
</fieldset>
<!-- end em-c-fieldset -->
</form>		  

<form class="em-js-form" id="EventsForm" style="border-radius: 20px; padding: 15px; border: 2px solid red;" onsubmit="return false">
<h3 class="em-u-text-align-center" id="EventLegend">LOG A NEW EVENT/KEY FACT</h3>
   <fieldset class="em-c-fieldset">
<div class="em-l-grid em-l-grid--2up ">
  <div class="em-l-grid__item em-u-width-75">	
	<div class="em-c-field ">
				<label for="file" class="em-c-field__label">Event/Key Fact</label>
                <div class="em-c-field__body">
                  <input type="" id="EventTitle" class="em-c-input" placeholder="What happened" value="" />
                </div>
                <!-- end em-c-field__body -->               
	</div>
<!-- end em-c-field -->
  </div>
 <div class="em-l-grid__item em-u-width-25">
 <div class="em-c-field em-c-field--checkbox ">
                <h4 for="file" class="em-c-field__label">Key Fact</h4>
                <div class="em-c-field__body">
                  <ul class="em-c-option-list">
                    <li class="em-c-option-list__item">
                      <label class="em-c-input-group" for="EventKeyFact">
                        <input id="EventKeyFact" type="checkbox" name="EventKeyFact" value="1" class="em-c-input-group__control em-js-checkbox-trigger">
                        <span class="em-c-input-group__text">This is a key fact.</span>
                      </label>
                    </li>
                    <!-- end em-c-checkbox-list__item -->
                  </ul>
                  <!-- end em-c-option-list -->
                </div>
                <!-- end em-c-field__body -->
                
</div>
<!--end em-c-field-->
</div>
</div>
  
<div class="em-l-grid em-l-grid--3up ">
	<div class="em-l-grid__item">
		<div class="em-c-field">
			<label for="EventDate" class="em-c-field__label">Event Date/Time</label>
			<div class="em-c-field__body">
			<input type="text" name="EventDate" id="EventDate" value=""> 
				<script type="text/javascript"> 
					$(function(){ 
						$('*[name=EventDate]').appendDtpicker({"minuteInterval": 10, "dateFormat": "YYYY-MM-DD hh:mm:00"}); 
					});
					</script> 
			</div>
<!-- end em-c-field__body -->
		</div>
<!-- end em-c-field-date-picker -->
<div class="em-c-field ">
				<label for="file" class="em-c-field__label">Contact/Source</label>
                <div class="em-c-field__body">
                  <input type="" id="EventContact" class="em-c-input" placeholder="Enter Contact/Source" value="" />
			    </div>
<!-- end em-c-field__body -->
</div> 
<!-- end em-c-field -->
	</div>
  <!-- end em-l-grid__item -->
  <div class="em-l-grid__item">
  <div class="em-c-field">
			<h4 for="" class="em-c-field__label">Time Zone</h4>
			<div class="em-c-field__body">
			<ul class="em-c-option-list ">
				<li class="em-c-option-list__item em-js-radio-trigger-parent">
			<label class="em-c-input-group" for="EventTZ-1">
			<input id="EventTZ-1" type="radio" name="EventTZ" value="CST" class="em-c-input-group__control em-js-radio-trigger" >
			<span class="em-c-input-group__text">CST (Houston)</span>
			</label>
				</li>
<!-- end em-c-radio-list__item -->
				<li class="em-c-option-list__item em-js-radio-trigger-parent">
			<label class="em-c-input-group" for="EventTZ-2">
			<input id="EventTZ-2" type="radio" name="EventTZ" value="CET" class="em-c-input-group__control em-js-radio-trigger">
			<span class="em-c-input-group__text">CET (Europe)</span>
			</label>
				</li>
<!-- end em-c-radio-list__item -->
				<li class="em-c-option-list__item em-js-radio-trigger-parent">
			<label class="em-c-input-group" for="EventTZ-3">
			<input id="EventTZ-3" type="radio" name="EventTZ" value="ICT" class="em-c-input-group__control em-js-radio-trigger">
			<span class="em-c-input-group__text">ICT (Bangkok)</span>
			</label>
				</li>
      <!-- end em-c-radio-list__item -->
			</ul>
    <!-- end em-c-option-list -->
			</div>
  <!-- end em-c-field__body -->
		</div>
<!-- end em-c-field -->
 </div>
  <!-- end em-l-grid__item -->
<div class="em-l-grid__item">

<div class="em-c-field em-c-field--checkbox ">
                <h4 for="file" class="em-c-field__label">Communication</h4>
                <div class="em-c-field__body">
                  <ul class="em-c-option-list">
                    <li class="em-c-option-list__item">
                      <label class="em-c-input-group" for="EventIntComm">
                        <input id="EventIntComm" type="checkbox" name="EventIntComm" value="1" class="em-c-input-group__control em-js-checkbox-trigger" >
                        <span class="em-c-input-group__text">Internal</span>
                      </label>
                    </li>
                    <!-- end em-c-checkbox-list__item -->
					<li class="em-c-option-list__item">
                      <label class="em-c-input-group" for="EventExtComm">
                        <input id="EventExtComm" type="checkbox" name="EventExtComm" value="1" class="em-c-input-group__control em-js-checkbox-trigger" >
                        <span class="em-c-input-group__text">External</span>
                      </label>
                    </li>
                    <!-- end em-c-checkbox-list__item -->
                  </ul>
                  <!-- end em-c-option-list -->
                </div>
                <!-- end em-c-field__body -->
                
</div>
<!--end em-c-field-->
<br/>
<br/>
<div class="em-c-btn-group ">
                <button class="em-c-btn em-c-btn--primary" onclick="UpdateListItem(EditID, 1)" >
                  <span class="em-c-btn__text" id="EventSave">Submit</span>
                </button>
                <!-- end em-c-btn -->
                <button class="em-c-btn em-c-btn--secondary" onclick="CancelForms()">
                  <span class="em-c-btn__text">Cancel</span>
                </button>
                <!-- end em-c-btn -->
 </div>
              <!-- end em-c-btn-group -->

  </div>
  <!-- end em-l-grid__item -->
</div>
<!-- end em-l-grid -->
</fieldset>
<!-- end em-c-fieldset -->
</form>

<form class="em-js-form" id="IRTObjectivesForm" style="border-radius: 20px; padding: 15px; border: 2px solid red;" onsubmit="return false">
<h3 class="em-u-text-align-center" id="IRTObjectivesLegend">LOG A NEW OBJECTIVE</h3>
   <fieldset class="em-c-fieldset">
<div class="em-l-grid em-l-grid--2up "> 
	<div class="em-l-grid__item em-u-width-75">
		<div class="em-c-field ">
                <label for="IRTObjective" class="em-c-field__label">Objective</label>
                <div class="em-c-field__body">
                  <input type="" id="IRTObjective" class="em-c-input" placeholder="Enter Objective" value="" />
                </div>
                <!-- end em-c-field__body -->
        </div>
        <!-- end em-c-field -->
	</div>
	  <div class="em-l-grid__item em-u-width-25">	
	<div id="IRTObjStatus" class="em-c-field__body">
	<h4 for="" class="em-c-field__label">Status</h4>
  <div class="em-c-field__body">
    <ul class="em-c-option-list ">
      <li class="em-c-option-list__item em-js-radio-trigger-parent">
        <label class="em-c-input-group" for="IRTStatus-1">
          <input id="IRTStatus-1" type="radio" name="IRTStatus" value="Not Started" class="em-c-input-group__control em-js-radio-trigger" checked >
          <span class="em-c-input-group__text">Not Started</span>
        </label>
      </li>
      <!-- end em-c-radio-list__item -->
      <li class="em-c-option-list__item em-js-radio-trigger-parent">
        <label class="em-c-input-group" for="IRTStatus-2">
          <input id="IRTStatus-2" type="radio" name="IRTStatus" value="In Progress" class="em-c-input-group__control em-js-radio-trigger">
          <span class="em-c-input-group__text">In Progress</span>
        </label>
      </li>
      <!-- end em-c-radio-list__item -->
	        <li class="em-c-option-list__item em-js-radio-trigger-parent">
        <label class="em-c-input-group" for="IRTStatus-3">
          <input id="IRTStatus-3" type="radio" name="IRTStatus" value="Completed" class="em-c-input-group__control em-js-radio-trigger">
          <span class="em-c-input-group__text">Completed</span>
        </label>
      </li>
      <!-- end em-c-radio-list__item -->
    </ul>
    <!-- end em-c-option-list -->
  </div>
 </div>
 </div>
	
</div>
<div class="em-l-grid em-l-grid--2up ">
  <div class="em-l-grid__item">
    <div class="em-c-field ">
                <label for="IRTTactics" class="em-c-field__label">Tactics</label>
                <div class="em-c-field__body">
                  <textarea class="em-c-textarea " id="IRTTactics" placeholder="Enter Tactics" value="" rows="10"></textarea>
                </div>
                <!-- end em-c-field__body -->
	</div>
<!-- end em-c-field -->
  </div>
  <div class="em-l-grid__item">
  <div class="em-c-field em-c-field--toggle">
                <h4 class="em-c-field__label">Priority</h4>
                <div class="em-c-field__body">
                  <div class="em-c-toggle">
                    <input class="em-c-toggle__input em-u-is-vishidden" type="radio" id="IRTObjPriority-1" name="IRTObjPriority" value="High" />
                    <label class="em-c-toggle__label" for="IRTObjPriority-1">
                      High
                    </label>
                    <input class="em-c-toggle__input em-u-is-vishidden" type="radio" id="IRTObjPriority-2" name="IRTObjPriority" value="Medium" />
                    <label class="em-c-toggle__label" for="IRTObjPriority-2">
                      Medium
                    </label>
					<input class="em-c-toggle__input em-u-is-vishidden" type="radio" id="IRTObjPriority-3" name="IRTObjPriority" value="Low" />
                    <label class="em-c-toggle__label" for="IRTObjPriority-3">
                      Low
                    </label>
                  </div>
                  <!-- end em-c-toggle -->
                </div>
                <!-- end em-c-field__body -->
              </div>
              <!-- end em-c-field -->
    <div class="em-c-field em-c-field--checkbox ">
                <h4 for="file" class="em-c-field__label">Goal</h4>
                <div class="em-c-field__body">
                  <ul class="em-c-option-list">
                    <li class="em-c-option-list__item">
                      <label class="em-c-input-group" for="IRTGoal-1">
                        <input id="IRTGoal-1" type="checkbox" name="IRTGoal[]" value="Control the Source" class="em-c-input-group__control em-js-checkbox-trigger">
                        <span class="em-c-input-group__text">Control the Source</span>
                      </label>
                    </li>
                    <!-- end em-c-checkbox-list__item -->
                    <li class="em-c-option-list__item">
                      <label class="em-c-input-group" for="IRTGoal-2">
                        <input id="IRTGoal-2" type="checkbox" name="IRTGoal[]" value="Manage the Response" class="em-c-input-group__control em-js-checkbox-trigger">
                        <span class="em-c-input-group__text">Manage the Response</span>
                      </label>
                    </li>
                    <!-- end em-c-checkbox-list__item -->
                  </ul>
                  <!-- end em-c-option-list -->
                </div>
                <!-- end em-c-field__body -->
    </div>
              <!--end em-c-field-->
    <br/>
  	<div class="em-c-btn-group ">
                <button class="em-c-btn em-c-btn--primary" onclick="UpdateListItem(EditID, 2)">
                  <span class="em-c-btn__text">Submit</span>
                </button>
                <!-- end em-c-btn -->
                <button class="em-c-btn em-c-btn--secondary" onclick="CancelForms()">
                  <span class="em-c-btn__text">Cancel</span>
                </button>
                <!-- end em-c-btn -->
              </div>
              <!-- end em-c-btn-group -->
	</div>

</div>
</fieldset>
<!-- end em-c-fieldset -->
</form>
            
<form class="em-js-form" id="ActionsForm"  style="border-radius: 20px; padding: 15px; border: 2px solid red;" onsubmit="return false">
<h3 class="em-u-text-align-center" id="ActionsLegend">LOG A NEW ACTION</h3>
<fieldset class="em-c-fieldset">
<div class="em-l-grid ">
  <div class="em-l-grid__item ">   
	<div class="em-c-field ">
                <label for="file" class="em-c-field__label">Action</label>
                <div class="em-c-field__body">
                  <input type="" id="ActionTitle" class="em-c-input" placeholder="Enter Action" value="" />
                </div>
                <!-- end em-c-field__body -->
	</div>
  </div>
</div>
<div class="em-l-grid em-l-grid--3up">
<div class="em-l-grid__item">
<div class="em-c-field em-js-typeahead ">
				<div name="search" class="em-c-search-form" novalidate>
					<label for="" class="em-c-field__label">Pick a person</label>
					<div class="em-c-field__body">
						<input ng-model="dft.user" uib-typeahead="User as User.DisplayText for User in dft.searchSP($viewValue)" typeahead-loading="dft.loading"
							typeahead-no-results="dft.noResults" ng-model-options="{ debounce: { default: 500, blur: 250 }, getterSetter: true }"
							type="text" id="ActionAssigned" pp-is-multiuser="{{true}}" class="em-c-input em-js-typeahead" placeholder="Select a person" value="" multiple />
					</div>
					
					<div class="em-c-field__note">Start typing a person's name</div>
				</div> 
</div>
<!-- end em-c-field -->				
</div>
	<div class="em-l-grid__item em-u-width-25">
    <div class="em-c-field em-c-field--toggle">
                <h4 class="em-c-field__label">Priority</h4>
                <div class="em-c-field__body">
                  <div class="em-c-toggle">
                    <input class="em-c-toggle__input em-u-is-vishidden" type="radio" id="ActionPriority-1" name="ActionPriority" value="High" />
                    <label class="em-c-toggle__label" for="ActionPriority-1">
                      High
                    </label>
                    <input class="em-c-toggle__input em-u-is-vishidden" type="radio" id="ActionPriority-2" name="ActionPriority" value="Medium" />
                    <label class="em-c-toggle__label" for="ActionPriority-2">
                      Medium
                    </label>
					<input class="em-c-toggle__input em-u-is-vishidden" type="radio" id="ActionPriority-3" name="ActionPriority" value="Low" />
                    <label class="em-c-toggle__label" for="ActionPriority-3">
                      Low
                    </label>
                  </div>
                  <!-- end em-c-toggle -->
                </div>
                <!-- end em-c-field__body -->
              </div>
              <!-- end em-c-field -->
  </div>
  <!-- end em-l-grid__item -->
<div class="em-l-grid__item">
<div id="ActionStatus" class="em-c-field__body">
	<h4 for="" class="em-c-field__label">Status</h4>
  <div class="em-c-field__body">
    <ul class="em-c-option-list ">
      <li class="em-c-option-list__item em-js-radio-trigger-parent">
        <label class="em-c-input-group" for="ActionStatus-1">
          <input id="ActionStatus-1" type="radio" name="ActionStatus" value="Not Started" class="em-c-input-group__control em-js-radio-trigger" checked >
          <span class="em-c-input-group__text">Not Started</span>
        </label>
      </li>
      <!-- end em-c-radio-list__item -->
      <li class="em-c-option-list__item em-js-radio-trigger-parent">
        <label class="em-c-input-group" for="ActionStatus-2">
          <input id="ActionStatus-2" type="radio" name="ActionStatus" value="In Progress" class="em-c-input-group__control em-js-radio-trigger">
          <span class="em-c-input-group__text">In Progress</span>
        </label>
      </li>
      <!-- end em-c-radio-list__item -->
	        <li class="em-c-option-list__item em-js-radio-trigger-parent">
        <label class="em-c-input-group" for="ActionStatus-3">
          <input id="ActionStatus-3" type="radio" name="ActionStatus" value="Completed" class="em-c-input-group__control em-js-radio-trigger">
          <span class="em-c-input-group__text">Completed</span>
        </label>
      </li>
      <!-- end em-c-radio-list__item -->
    </ul>
    <!-- end em-c-option-list -->
  </div>
 </div>
</div>
</div>
<div class="em-l-grid em-l-grid--3up "> 
<div class="em-l-grid__item"> 
<div id="ActionStart" class="em-c-field">
			<label for="ActionStartDate" class="em-c-field__label">Start Date/Time</label>
			<div class="em-c-field__body">
			<input type="text" name="ActionStartDate" id="ActionStartDate" value=""> 
				<script type="text/javascript"> 
					$(function(){ 
						$('*[name=ActionStartDate]').appendDtpicker({"minuteInterval": 10, "dateFormat": "YYYY-MM-DD hh:mm:00"}); 
					});
					</script> 
			</div>
<!-- end em-c-field__body -->
</div>
</div>
<div class="em-l-grid__item">
<div id="ActionDue" class="em-c-field">
			<label for="ActionDueDate" class="em-c-field__label">Due Date/Time</label>
			<div class="em-c-field__body">
			<input type="text" name="ActionDueDate" id="ActionDueDate" value=""> 
				<script type="text/javascript"> 
					$(function(){ 
						$('*[name=ActionDueDate]').appendDtpicker({"minuteInterval": 10, "dateFormat": "YYYY-MM-DD hh:mm:00"}); 
					});
					</script> 
			</div>
<!-- end em-c-field__body -->
</div>
</div>
<div class="em-l-grid__item">			  
<div id="ActionTZ" class="em-c-field">
			<h4 for="" class="em-c-field__label">Time Zone</h4>
			<div class="em-c-field__body">
			<ul class="em-c-option-list ">
				<li class="em-c-option-list__item em-js-radio-trigger-parent">
			<label class="em-c-input-group" for="ActionTZ-1">
			<input id="ActionTZ-1" type="radio" name="ActionTZ" value="CST" class="em-c-input-group__control em-js-radio-trigger" >
			<span class="em-c-input-group__text">CST (Houston)</span>
			</label>
				</li>
<!-- end em-c-radio-list__item -->
				<li class="em-c-option-list__item em-js-radio-trigger-parent">
			<label class="em-c-input-group" for="ActionTZ-2">
			<input id="ActionTZ-2" type="radio" name="ActionTZ" value="CET" class="em-c-input-group__control em-js-radio-trigger">
			<span class="em-c-input-group__text">CET (Europe)</span>
			</label>
				</li>
<!-- end em-c-radio-list__item -->
				<li class="em-c-option-list__item em-js-radio-trigger-parent">
			<label class="em-c-input-group" for="ActionTZ-3">
			<input id="ActionTZ-3" type="radio" name="ActionTZ" value="ICT" class="em-c-input-group__control em-js-radio-trigger">
			<span class="em-c-input-group__text">ICT (Bangkok)</span>
			</label>
				</li>
      <!-- end em-c-radio-list__item -->
			</ul>
    <!-- end em-c-option-list -->
			</div>
  <!-- end em-c-field__body -->
		</div>
<!-- end em-c-field -->
</div>
</div>
<div class="em-l-grid em-l-grid--2up">
<div class="em-l-grid__item em-u-width-75">
<div class="em-c-field ">
                <label for="Notes" class="em-c-field__label">Notes</label>
                <div class="em-c-field__body">
                  <textarea class="em-c-textarea " id="ActionNotes" placeholder="Enter Notes" value="" rows="10"></textarea>
                </div>
</div>
</div>
<div class="em-l-grid__item em-u-width-25">		
	<br/>
	<br/>
	<div id="ActionSubmit" class="em-c-btn-group ">
                <button class="em-c-btn em-c-btn--primary" id="BtnActionsSubmit" onclick="UpdateListItem(EditID, 3)">     
<!-- UpdateListItem(EditID, 3)				 -->
                  <span class="em-c-btn__text">Submit</span>
                </button>
                <!-- end em-c-btn -->
                <button class="em-c-btn em-c-btn--secondary" onclick="CancelForms()">
                  <span class="em-c-btn__text">Cancel</span>
                </button>
                <!-- end em-c-btn -->
              </div>
</div>
</div>		  
</fieldset>
</form>
 
<form class="em-js-form" id="ESGObjectivesForm" style="border-radius: 20px; padding: 15px; border: 2px solid red;" onsubmit="return false">
<h3 class="em-u-text-align-center" id="ESGObjectivesLegend">LOG A NEW OBJECTIVE</h3>
   <fieldset class="em-c-fieldset">
<div class="em-l-grid em-l-grid--2up "> 
	<div class="em-l-grid__item em-u-width-75">
		<div class="em-c-field ">
                <label for="ESGObjective" class="em-c-field__label">Objective</label>
                <div class="em-c-field__body">
                  <input type="" id="ESGObjective" class="em-c-input" placeholder="Enter Objective" value="" />
                </div>
                <!-- end em-c-field__body -->
        </div>
        <!-- end em-c-field -->
	</div>
	<div class="em-l-grid__item em-u-width-25">
	<div class="em-c-field em-c-field--toggle">
                <h4 class="em-c-field__label">Priority</h4>
                <div class="em-c-field__body">
                  <div class="em-c-toggle">
                    <input class="em-c-toggle__input em-u-is-vishidden" type="radio" id="ESGObjPriority-1" name="ESGObjPriority" value="High" />
                    <label class="em-c-toggle__label" for="ESGObjPriority-1">
                      High
                    </label>
                    <input class="em-c-toggle__input em-u-is-vishidden" type="radio" id="ESGObjPriority-2" name="ESGObjPriority" value="Medium" />
                    <label class="em-c-toggle__label" for="ESGObjPriority-2">
                      Medium
                    </label>
					<input class="em-c-toggle__input em-u-is-vishidden" type="radio" id="ESGObjPriority-3" name="ESGObjPriority" value="Low" />
                    <label class="em-c-toggle__label" for="ESGObjPriority-3">
                      Low
                    </label>
                  </div>
                  <!-- end em-c-toggle -->
                </div>
                <!-- end em-c-field__body -->
              </div>
              <!-- end em-c-field -->
	</div>
</div>
<div class="em-l-grid em-l-grid--2up ">
<div class="em-l-grid__item">
  <div class="em-c-field em-c-field--checkbox ">
                <h4 for="file" class="em-c-field__label">PEAR</h4>
                <div class="em-c-field__body">
                  <ul class="em-c-option-list">
                    <li class="em-c-option-list__item">
                      <label class="em-c-input-group" for="PEARcheck-1">
                        <input id="PEARcheck-1" type="checkbox" name="PEARcheck[]" value="People" class="em-c-input-group__control em-js-checkbox-trigger">
                        <span class="em-c-input-group__text">People</span>
                      </label>
                    </li>
                    <!-- end em-c-checkbox-list__item -->
                    <li class="em-c-option-list__item">
                      <label class="em-c-input-group" for="PEARcheck-2">
                        <input id="PEARcheck-2" type="checkbox" name="PEARcheck[]" value="Environment" class="em-c-input-group__control em-js-checkbox-trigger">
                        <span class="em-c-input-group__text">Environment</span>
                      </label>
                    </li>
                    <!-- end em-c-checkbox-list__item -->
					<li class="em-c-option-list__item">
                      <label class="em-c-input-group" for="PEARcheck-3">
                        <input id="PEARcheck-3" type="checkbox" name="PEARcheck[]" value="Assets" class="em-c-input-group__control em-js-checkbox-trigger">
                        <span class="em-c-input-group__text">Assets</span>
                      </label>
                    </li>
                    <!-- end em-c-checkbox-list__item -->
					<li class="em-c-option-list__item">
                      <label class="em-c-input-group" for="PEARcheck-4">
                        <input id="PEARcheck-4" type="checkbox" name="PEARcheck[]" value="Reputation" class="em-c-input-group__control em-js-checkbox-trigger">
                        <span class="em-c-input-group__text">Reputation</span>
                      </label>
                    </li>
                    <!-- end em-c-checkbox-list__item -->
                  </ul>
                  <!-- end em-c-option-list -->
                </div>
                <!-- end em-c-field__body -->
              </div>
              <!--end em-c-field-->
  </div>
<div class="em-l-grid__item">
    
	<div class="em-c-field em-c-field--checkbox ">
                <h4 for="file" class="em-c-field__label">Goal</h4>
                <div class="em-c-field__body">
                  <ul class="em-c-option-list">
                    <li class="em-c-option-list__item">
                      <label class="em-c-input-group" for="ESGGoal-1">
                        <input id="ESGGoal-1" type="checkbox" name="ESGGoal[]" value="Control the Source" class="em-c-input-group__control em-js-checkbox-trigger">
                        <span class="em-c-input-group__text">Control the Source</span>
                      </label>
                    </li>
                    <!-- end em-c-checkbox-list__item -->
                    <li class="em-c-option-list__item">
                      <label class="em-c-input-group" for="ESGGoal-2">
                        <input id="ESGGoal-2" type="checkbox" name="ESGGoal[]" value="Manage the Response" class="em-c-input-group__control em-js-checkbox-trigger">
                        <span class="em-c-input-group__text">Manage the Response</span>
                      </label>
                    </li>
                    <!-- end em-c-checkbox-list__item -->
                  </ul>
                  <!-- end em-c-option-list -->
                </div>
                <!-- end em-c-field__body -->
    </div>
              <!--end em-c-field-->
<div id="ESGObjStatus" class="em-c-field__body">
	<h4 for="" class="em-c-field__label">Status</h4>
  <div class="em-c-field__body">
    <ul class="em-c-option-list ">
      <li class="em-c-option-list__item em-js-radio-trigger-parent">
        <label class="em-c-input-group" for="ESGStatus-1">
          <input id="ESGStatus-1" type="radio" name="ESGStatus" value="Not Started" class="em-c-input-group__control em-js-radio-trigger" checked >
          <span class="em-c-input-group__text">Not Started</span>
        </label>
      </li>
      <!-- end em-c-radio-list__item -->
      <li class="em-c-option-list__item em-js-radio-trigger-parent">
        <label class="em-c-input-group" for="ESGStatus-2">
          <input id="ESGStatus-2" type="radio" name="ESGStatus" value="In Progress" class="em-c-input-group__control em-js-radio-trigger">
          <span class="em-c-input-group__text">In Progress</span>
        </label>
      </li>
      <!-- end em-c-radio-list__item -->
	        <li class="em-c-option-list__item em-js-radio-trigger-parent">
        <label class="em-c-input-group" for="ESGStatus-3">
          <input id="ESGStatus-3" type="radio" name="ESGTStatus" value="Completed" class="em-c-input-group__control em-js-radio-trigger">
          <span class="em-c-input-group__text">Completed</span>
        </label>
      </li>
      <!-- end em-c-radio-list__item -->
    </ul>
    <!-- end em-c-option-list -->
  </div>
 </div>
 </div>
</div>
<div class="em-l-grid em-l-grid--2up ">
 <div class="em-l-grid__item em-u-width-75">
    <div class="em-c-field ">
                <label for="Tactics" class="em-c-field__label">Tactics</label>
                <div class="em-c-field__body">
                  <textarea class="em-c-textarea " id="ESGTactics" placeholder="Enter Tactics" value="" rows="10"></textarea>
                </div>
                <!-- end em-c-field__body -->
	</div>
<!-- end em-c-field -->
  </div>
  <!-- end em-l-grid__item -->
  <div class="em-l-grid__item em-u-width-25">   
	<div class="em-c-btn-group ">
                
	<button class="em-c-btn em-c-btn--primary" onclick="UpdateListItem(EditID, 2)">
                  <span class="em-c-btn__text">Submit</span>
                </button>
                <!-- end em-c-btn -->
                <button class="em-c-btn em-c-btn--secondary" onclick="CancelForms()">
                  <span class="em-c-btn__text">Cancel</span>
                </button>
                <!-- end em-c-btn -->
              </div>
              <!-- end em-c-btn-group -->
  </div>
  <!-- end em-l-grid__item -->
</div>
<!-- end em-l-grid -->
</fieldset>
<!-- end em-c-fieldset -->
</form> 
 	  
<form class="em-js-form" id="WorstCaseForm" style="border-radius: 20px; padding: 15px; border: 2px solid red;" onsubmit="return false">
<h3 class="em-u-text-align-center" id="WCSLegend">LOG A NEW WORST CASE SCENARIO</h3>
   <fieldset class="em-c-fieldset">
<div class="em-l-grid em-l-grid--1up "> 
	<div class="em-l-grid__item">
		<div class="em-c-field ">
                <label for="WCSTitle" class="em-c-field__label">Scenario</label>
                <div class="em-c-field__body">
                  <input type="" id="WCSTitle" class="em-c-input" placeholder="Enter Scenario" value="" />
                </div>
                <!-- end em-c-field__body -->
        </div>
        <!-- end em-c-field -->
	</div>
</div>
<div class="em-l-grid em-l-grid--3up ">
<div class="em-l-grid__item">
  <div class="em-c-field em-c-field--checkbox ">
                <h4 for="file" class="em-c-field__label">PEAR</h4>
                <div class="em-c-field__body">
                  <ul class="em-c-option-list">
                    <li class="em-c-option-list__item">
                      <label class="em-c-input-group" for="WCSPEAR-1">
                        <input id="WCSPEAR-1" type="checkbox" name="WCSPEAR[]" value="People" class="em-c-input-group__control em-js-checkbox-trigger">
                        <span class="em-c-input-group__text">People</span>
                      </label>
                    </li>
                    <!-- end em-c-checkbox-list__item -->
                    <li class="em-c-option-list__item">
                      <label class="em-c-input-group" for="WCSPEAR-2">
                        <input id="WCSPEAR-2" type="checkbox" name="WCSPEAR[]" value="Environment" class="em-c-input-group__control em-js-checkbox-trigger">
                        <span class="em-c-input-group__text">Environment</span>
                      </label>
                    </li>
                    <!-- end em-c-checkbox-list__item -->
					<li class="em-c-option-list__item">
                      <label class="em-c-input-group" for="WCSPEAR-3">
                        <input id="WCSPEAR-3" type="checkbox" name="WCSPEAR[]" value="Assets" class="em-c-input-group__control em-js-checkbox-trigger">
                        <span class="em-c-input-group__text">Assets</span>
                      </label>
                    </li>
                    <!-- end em-c-checkbox-list__item -->
					<li class="em-c-option-list__item">
                      <label class="em-c-input-group" for="WCSPEAR-4">
                        <input id="WCSPEAR-4" type="checkbox" name="WCSPEAR[]" value="Reputation" class="em-c-input-group__control em-js-checkbox-trigger">
                        <span class="em-c-input-group__text">Reputation</span>
                      </label>
                    </li>
                    <!-- end em-c-checkbox-list__item -->
                  </ul>
                  <!-- end em-c-option-list -->
                </div>
                <!-- end em-c-field__body -->
              </div>
              <!--end em-c-field-->
  </div>
  <!-- end em-l-grid__item -->
<div class="em-l-grid__item">
    <div class="em-c-field em-c-field--toggle">
                <h4 class="em-c-field__label">Severity</h4>
                <div class="em-c-field__body em-u-text-align-center">
                  <div class="em-c-toggle">
                    <input class="em-c-toggle__input em-u-is-vishidden" type="radio" id="WCSSeverity-1" value="High" name="WCSSeverity" />
                    <label class="em-c-toggle__label" for="WCSSeverity-1">
                      High
                    </label>
                    <input class="em-c-toggle__input em-u-is-vishidden" type="radio" id="WCSSeverity-2" value="Medium" name="WCSSeverity" />
                    <label class="em-c-toggle__label" for="WCSSeverity-2">
                      Medium
                    </label>
					<input class="em-c-toggle__input em-u-is-vishidden" type="radio" id="WCSSeverity-3" value="Low" name="WCSSeverity" />
                    <label class="em-c-toggle__label" for="WCSSeverity-3">
                      Low
                    </label>
                  </div>
                  <!-- end em-c-toggle -->
                </div>
                <!-- end em-c-field__body -->
              </div>
              <!-- end em-c-field -->
	<div class="em-c-field em-c-field--toggle">
                <h4 class="em-c-field__label">Probability</h4>
                <div class="em-c-field__body em-u-text-align-center">
                  <div class="em-c-toggle">
                    <input class="em-c-toggle__input em-u-is-vishidden" type="radio" id="WCSProbability-1" value="High" name="WCSProbability"  />
                    <label class="em-c-toggle__label" for="WCSProbability-1">
                      High
                    </label>
                    <input class="em-c-toggle__input em-u-is-vishidden" type="radio" id="WCSProbability-2" value="Medium" name="WCSProbability" />
                    <label class="em-c-toggle__label" for="WCSProbability-2">
                      Medium
                    </label>
					<input class="em-c-toggle__input em-u-is-vishidden" type="radio" id="WCSProbability-3" value="Low" name="WCSProbability" />
                    <label class="em-c-toggle__label" for="WCSProbability-3">
                      Low
                    </label>
                  </div>
                  <!-- end em-c-toggle -->
                </div>
                <!-- end em-c-field__body -->
              </div>
              <!-- end em-c-field -->
 </div>
 <div class="em-l-grid__item">
<br/>
<br/>			  
	<div class="em-c-btn-group em-u-text-align-center">
                <button class="em-c-btn em-c-btn--primary" onclick="UpdateListItem(EditID, 4)">
                  <span class="em-c-btn__text">Submit</span>
                </button>
                <!-- end em-c-btn -->
                <button class="em-c-btn em-c-btn--secondary" onclick="CancelForms()">
                  <span class="em-c-btn__text">Cancel</span>
                </button>
                <!-- end em-c-btn -->
              </div>
              <!-- end em-c-btn-group -->
  </div>
</div>

</fieldset>
<!-- end em-c-fieldset -->
</form> 

<form class="em-js-form" id="TeamForm" style="border-radius: 20px; padding: 15px; border: 2px solid red;" onsubmit="return false" >
<h3 class="em-u-text-align-center" id="TeamLegend">ADD A NEW TEAM MEMBER</h3>
<fieldset class="em-c-fieldset">
<div class="em-l-grid em-l-grid--2up "> 
<div class="em-l-grid__item">
<div class="em-c-field em-js-typeahead ">
				<div name="search" class="em-c-search-form" novalidate>
					<label for="" class="em-c-field__label">Pick a person</label>
					<div class="em-c-field__body">
						<input ng-model="dft.user" uib-typeahead="User as User.DisplayText for User in dft.searchSP($viewValue)" typeahead-loading="dft.loading"
							typeahead-no-results="dft.noResults" ng-model-options="{ debounce: { default: 500, blur: 250 }, getterSetter: true }"
							type="text" id="TeamContact" class="em-c-input em-js-typeahead" placeholder="Select a person" value="" multiple />
					</div>
					
					<div class="em-c-field__note">Start typing a person's name</div>
				</div> 
			</div>				
</div>
	<div class="em-l-grid__item">
		<div class="em-c-field ">
  <label for="" class="em-c-field__label">Position</label>
  <div class="em-c-field__body">
    <select name="TeamPosition" title="TeamPosition" class="demo em-u-width-75" id="TeamPosition" style="height: 50px; visibility: hidden;">
<option data-suffix="<small>    IRT</small>">Deputy Technical Manager</option>
<option data-suffix="<small>    IRT</small>">EMIT Cyber Security</option>
<option data-suffix="<small>    IRT</small>">EMIT Network Team</option>
<option data-suffix="<small>    IRT</small>">EMIT Retail Helpdesk POS</option>
<option data-suffix="<small>    IRT</small>">Incident Technical Manager</option>
<option data-suffix="<small>    IRT</small>">Liaison</option>
<option data-suffix="<small>    IRT</small>">Scriber</option>
<option data-suffix="<small>    IRT</small>">Support</option>
<option data-suffix="<small>    ESG</small>">Admin Support</option>
<option data-suffix="<small>    ESG</small>">BW Support/Retail Country Interface</option>
<option data-suffix="<small>    ESG</small>">Card Programs</option>
<option data-suffix="<small>    ESG</small>">Customer Care</option>
<option data-suffix="<small>    ESG</small>">Deputy ESG Leader</option>
<option data-suffix="<small>    ESG</small>">EM Management</option>
<option data-suffix="<small>    ESG</small>">ESG Leader</option>
<option data-suffix="<small>    ESG</small>">Facilitator</option>
<option data-suffix="<small>    ESG</small>">Law</option>
<option data-suffix="<small>    ESG</small>">Marketing</option>
<option data-suffix="<small>    ESG</small>">Public and Government Affairs</option>
<option data-suffix="<small>    ESG</small>">SSHE</option>
<option data-suffix="<small>    ESG</small>">Security</option>
</select>
  </div>
  <!-- end em-c-field__body -->
</div>
<!-- end em-c-field -->
</div>
</div>
<!-- end grid -->
<div class="em-l-grid em-l-grid--1up ">
<div class="em-l-grid__item">
<br/>
<br/>			  
	<div class="em-c-btn-group em-u-text-align-center">
                <button class="em-c-btn em-c-btn--primary" id="TeamSave" onclick="UpdateListItem(EditID, 5)">
                  <span class="em-c-btn__text">Submit</span>
                </button>
                <!-- end em-c-btn -->
                <button class="em-c-btn em-c-btn--secondary" onclick="CancelForms()">
                  <span class="em-c-btn__text">Cancel</span>
                </button>
                <!-- end em-c-btn -->
              </div>
              <!-- end em-c-btn-group -->
  </div>
  <!-- end em-l-grid__item -->
</div>
<!-- end em-l-grid -->
</fieldset>
<!-- end em-c-fieldset -->
</form>

<form class="em-js-form" id="KeyDocsForm" style="border-radius: 20px; padding: 15px; border: 2px solid red;" onsubmit="return false" >
<h3 class="em-u-text-align-center" id="TeamLegend">ADD KEY DOCUMENTS</h3>
<fieldset class="em-c-fieldset">
<div class="em-l-grid em-l-grid--2up "> 
<div class="em-l-grid__item">
<div class="em-c-field em-c-field--file-upload ">
                <label for="file" class="em-c-field__label">Add Documents</label>
                <div class="em-c-field__body">
                  <svg class="em-c-icon em-c-icon--large em-c-field__block-icon">
                    <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="/sites/FMRE012/SiteAssets/unity-1.3.0/images/48/em-icons.svg#upload"></use>
                  </svg>
                  <input type="file" name="KeyFile[]" id="KeyFile" class="em-c-file-upload" placeholder="Placeholder" value="" multiple />
                  <ul class="em-c-field__list em-js-field-list">
                    <li class="em-c-field__item">Drag files here</li>
                    <li class="em-c-field__item em-c-field__item--small">Or click to choose file</li>
                  </ul>
                </div>
                <!-- end em-c-field__body -->
</div>		
</div>
	<div class="em-l-grid__item">
		<div class="em-c-field ">
  <label for="" class="em-c-field__label">Related To</label>
  <div class="em-c-field__body">
    <select name="Related" title="Related" class="demo " id="Related" style="height: 50px; visibility: hidden;">
<option selected">Incident</option>
<option>Events</option>
<option>Objectives</option>
<option>Actions</option>
<option>Worst Case Scenario</option>

</select>
  </div>
  <!-- end em-c-field__body -->
</div>
<!-- end em-c-field -->
<div class="em-c-field ">
                <label for="Keywords" class="em-c-field__label">Keywords</label>
                <div class="em-c-field__body">
                  <input type="" id="Keywords" class="em-c-input" placeholder="Enter Keywords" value="" />
                </div>
                <!-- end em-c-field__body -->
        </div>
	<div class="em-c-btn-group em-u-text-align-center">
                <button class="em-c-btn em-c-btn--primary" id="TeamSave" onclick="CreateFile()">
                  <span class="em-c-btn__text">Submit</span>
                </button>
                <!-- end em-c-btn -->
                <button class="em-c-btn em-c-btn--secondary" onclick="CancelForms()">
                  <span class="em-c-btn__text">Cancel</span>
                </button>
                <!-- end em-c-btn -->
              </div>
              <!-- end em-c-btn-group -->
</div>
</div>
<!-- end grid -->
</fieldset>
<!-- end em-c-fieldset -->
</form>

</div>
<!-- end Forms container -->

<!-- Modals -->
<div class="em-c-modal em-c-modal--alert em-js-modal-only " style="display:none" id="ModalESG">
  <div class="em-c-modal__window em-js-modal-window">
    <div class="em-c-modal__header">
      <h3 class="em-c-modal__title"></h3>
      <button class="em-c-btn em-c-btn--bare em-c-modal__close-btn em-js-modal-close-trigger">
        <div class="em-c-btn__inner">
          <svg class="em-c-icon em-c-icon--small em-c-btn__icon " data-em-icon-path="../../images/em-icons.svg">
            <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="/sites/FMRE012/SiteAssets/unity-1.3.0/images/em-icons.svg#x-filled"></use>
          </svg>
        </div>
      </button>
      <!-- end em-c-btn -->
    </div>
    <!-- end em-c-modal__header -->
    <div class="em-c-modal__body em-c-text-passage em-c-text-passage--small">
      An automatic email will be sent to the ESG Leader and Deputy starting the ESG Incident Response workflow. Do you wish to continue?
      <div class="em-c-btn-group em-c-modal--alert em-js-modal-only">
        <button class="em-c-btn em-c-btn--primary em-js-modal-confirm-trigger" id="BtnESG">
          <span class="em-c-btn__text">OK</span>
        </button>
        <!-- end em-c-btn -->
        <button class="em-c-btn em-c-btn--secondary em-js-modal-cancel-trigger">
          <span class="em-c-btn__text">Cancel</span>
        </button>
        <!-- end em-c-btn -->
      </div>
      <!-- end em-c-btn-group -->
    </div>
    <!-- end em-c-modal__body -->
  </div>
  <!-- end em-c-modal__window -->
</div>

<div class="em-c-modal em-js-modal-only" style="display:none" id="ModalDevelopment">
  <div class="em-c-modal__window em-js-modal-window">
    <div class="em-c-modal__header">
      <h3 class="em-c-modal__title">Coming Soon</h3>
      <button class="em-c-btn em-c-btn--bare em-c-modal__close-btn em-js-modal-close-trigger" id="BtnCloseDevelopment">
        <span class="em-c-btn__text">Close</span>
      </button>
      <!-- end em-c-btn -->
    </div>
    <!-- end em-c-modal__header -->
    <div class="em-c-modal__body em-c-text-passage em-c-text-passage--small">
      This section is currently under development. Please direct any questions or issues directly to Michael Mosley via <a href='sip:michael.j.mosley@exxonmobil.com'>Skype</a> or <a href='mailto:michael.j.mosley@exxonmobil.com'>Email</a>. 
    </div>
    <!-- end em-c-modal__body -->
  </div>
  <!-- end em-c-modal__window -->
</div>

</main>
<!-- end main -->

<footer class="em-c-footer " role="contentinfo" id="Footer" style="display:none">
  <div class="em-l-container">
    <div class="em-c-footer__inner">
      <ul class="em-c-multicolumn-nav " role="navigation">
        <li class="em-c-multicolumn-nav__item">
          <a href="/sites/FMRE012/SitePages/Home.aspx" class="em-c-multicolumn-nav__link">Global PLSO Team Site</a>
        </li>
        <!-- end em-c-footer-nav__item -->
        <li class="em-c-multicolumn-nav__item">
          <a href="/sites/FMRE012/SitePages/IRP.aspx" class="em-c-multicolumn-nav__link">PLSO Incident Response Home</a>
        </li>
        <!-- end em-c-footer-nav__item -->
        <li class="em-c-multicolumn-nav__item">
          <a href="#" onclick='javascript:$("#ModalDevelopment").show();' class="em-c-multicolumn-nav__link">Training</a>
        </li>
        <!-- end em-c-footer-nav__item -->
        <li class="em-c-multicolumn-nav__item">
          <a href="#" onclick='javascript:$("#ModalDevelopment").show();' class="em-c-multicolumn-nav__link">Support</a>
        </li>
        <!-- end em-c-footer-nav__item -->
      </ul>
      <!-- end em-c-footer-nav -->
      <svg class="em-c-logo" xmlns="http://www.w3.org/2000/svg" viewBox="63 150.1 234 59.8" enable-background="new 63 150.1 234 59.8">
      <path d="M145.7 156.5c-3.3 0-5 1.7-5.6 2.1v-1.5h-4.5v18.2h5v-10.1c0-2.6 1.4-4 3.5-4 2.2 0 3.5 1.5 3.5 4v10.1h5v-11.5c0-4.5-3.1-7.3-6.9-7.3zM196.5 156.5c-5.6 0-9.9 4.4-9.9 9.7 0 5.3 4.3 9.7 9.9 9.7 5.6 0 9.9-4.4 9.9-9.7 0-5.3-4.2-9.7-9.9-9.7zm0 14.3c-2.7 0-4.5-2.1-4.5-4.6 0-2.5 1.9-4.6 4.5-4.6 2.7 0 4.5 2.1 4.5 4.6.2 2.5-1.7 4.6-4.5 4.6zM122.5 156.5c-5.6 0-9.9 4.4-9.9 9.7 0 5.3 4.3 9.7 9.9 9.7 5.6 0 9.9-4.4 9.9-9.7 0-5.3-4.3-9.7-9.9-9.7zm0 14.3c-2.6 0-4.5-2.1-4.5-4.6 0-2.5 1.9-4.6 4.5-4.6 2.7 0 4.5 2.1 4.5 4.6 0 2.5-1.8 4.6-4.5 4.6zM232.6 157.1h5v18.3h-5zM232.6 150.1h5v4.5h-5zM242.6 150.1h5v25.2h-5zM220.5 156.5c-3.7 0-5.6 1.7-5.6 1.9v-8.3h-5v25.2h5v.1-1.5c.4.3 2 1.8 5.6 1.8 4.6 0 9-4.2 9-9.7 0-5.3-4.1-9.5-9-9.5zm-1.3 14.2c-2.6 0-4.6-2-4.6-4.6 0-2.6 2-4.6 4.6-4.6s4.6 2 4.6 4.6c0 2.6-2 4.6-4.6 4.6zM114.3 157.1h-6.4l-8.1 10.3-3.6-3.3 9.1-11.5h-6.3l-6.2 8-3.3-3.5h-7.7l7.7 7.5-8.6 10.7h6.4l5.6-7.3 3.5 3.9-8.1 10.3h6.3l5.2-7 9.7 9.5h7.8l-14.1-13.9zM63 175.3h17v-4.4h-12v-6.3h10.7v-4.4h-10.7v-5.6h12v-4.5h-17zM170.5 168.4h-.2l-4.3-18.3h-8.4v25.2h5.1v-18.9l4.5 18.9h6l4.8-18.9h-.2v18.9h5.7v-25.2h-8.7zM165.6 203.5h-8.5v-13.2h8.2v1.6h-6.5v4.2h6v1.6h-6v4.4h6.8v1.4zM175.2 203.5h-1.6v-5.8c0-.7-.2-1.2-.5-1.6-.3-.3-.9-.5-1.8-.5-.5 0-1 0-1.5.1-.4.1-.7.1-.9.2v7.5h-1.6v-8.8h.1c.5-.1 1.1-.3 1.7-.4.7-.1 1.4-.2 2.2-.2 1.4 0 2.4.3 2.9.8.6.6.9 1.4.9 2.5v6.2zM181.5 203.7c-.7 0-1.3-.1-1.9-.3-.5-.2-1-.5-1.4-.9-.4-.4-.7-.9-.9-1.5-.2-.6-.3-1.2-.3-2s.1-1.4.3-2c.2-.6.5-1.1.9-1.6.4-.4.9-.8 1.4-1 .6-.2 1.2-.3 1.8-.3.7 0 1.3.1 1.8.3.5.2.9.6 1.2 1 .3.4.6.9.7 1.4.1.5.2 1.1.2 1.7v.9h-6.8c0 .4.1.7.2 1 .1.4.3.7.6 1 .2.3.6.5 1 .7.4.2.9.2 1.4.2.6 0 1.2-.1 1.7-.3.5-.2.9-.4 1.2-.5l.2-.1v1.6h-.1c-.4.2-.9.4-1.4.5-.4.1-1.1.2-1.8.2zm-2.9-5.6h5.2l-.1-.9c-.1-.3-.2-.6-.4-.9-.2-.2-.5-.4-.8-.6-.3-.1-.7-.2-1.1-.2-.8 0-1.4.2-1.9.7-.5.5-.8 1.1-.9 1.9zM188.7 203.5h-1.6v-8.7h.1c.5-.2 1-.3 1.6-.4.6-.1 1.2-.2 1.8-.2.4 0 .7 0 1 .1.3 0 .5.1.7.1h.1v1.5h-.2c-.1 0-.3-.1-.6-.1-.5-.1-1.4-.1-2.1 0-.3.1-.6.1-.8.2v7.5zM196.2 208c-.8 0-1.5-.1-2-.2s-.9-.3-1.2-.4h-.1v-1.7l.2.1c.3.1.7.3 1.2.4.5.1 1.1.2 1.8.2 1 0 1.8-.2 2.3-.7.5-.5.8-1.3.8-2.4v-.3c-.3.1-.6.3-1 .4-.5.1-1 .2-1.6.2-.6 0-1.2-.1-1.8-.3-.5-.2-1-.5-1.4-1-.4-.4-.7-.9-.9-1.5-.2-.6-.3-1.2-.3-1.9s.1-1.3.3-1.9c.2-.6.5-1.1 1-1.6.4-.5 1-.8 1.6-1.1.6-.3 1.3-.4 2.2-.4.8 0 1.5.1 2.1.2.6.2 1 .3 1.3.4h.1v8.5c0 .7-.1 1.3-.2 1.8-.2.6-.4 1.1-.8 1.5-.4.4-.9.8-1.5 1-.5.6-1.3.7-2.1.7zm1.1-12.4c-.6 0-1.1.1-1.5.3-.4.2-.8.4-1 .7-.3.3-.5.7-.6 1.1-.1.4-.2.8-.2 1.3 0 1 .3 1.8.8 2.4.5.5 1.3.8 2.2.8.5 0 .9-.1 1.3-.2s.7-.3 1-.4v-5.7c-.2-.1-.5-.1-.8-.2-.3-.1-.7-.1-1.2-.1zM205.1 207.8h-1.7l2-4.5-3.7-9h1.7v.1l1.9 5 .5 1.3c.1.3.2.6.3.8l.3-.8c.1-.4.3-.8.5-1.3l2.2-5.1h1.7l-5.7 13.5zM217.6 203.5h-1.6v-14h1.6v14zM221.6 203.5h-1.6v-9.1h1.6v9.1zm.1-11h-1.8v-1.8h1.8v1.8zM227.7 203.5h-1.6l-3.7-9.1h1.7l2.3 5.8c.1.2.1.4.2.5.1.2.1.4.2.5 0 .1 0 .1.1.2l.3-.8.5-1.1 2.2-5.2h1.7l-3.9 9.2zM236.4 203.7c-.7 0-1.3-.1-1.9-.3-.5-.2-1-.5-1.4-.9-.4-.4-.7-.9-.9-1.5-.2-.6-.3-1.2-.3-2s.1-1.4.3-2c.2-.6.5-1.1.9-1.6.4-.4.9-.8 1.4-1 .6-.2 1.2-.3 1.8-.3.7 0 1.3.1 1.8.3.5.2.9.6 1.2 1 .3.4.6.9.7 1.4.1.5.2 1.1.2 1.7v.9h-6.8c0 .4.1.7.2 1 .1.4.3.7.6 1 .2.3.6.5 1 .7.4.2.9.2 1.4.2.6 0 1.2-.1 1.7-.3.5-.2.9-.4 1.2-.5l.2-.1v1.6h-.1c-.4.2-.9.4-1.4.5-.4.1-1.1.2-1.8.2zm-2.9-5.6h5.2l-.1-.9c-.1-.3-.2-.6-.4-.9-.2-.2-.5-.4-.8-.6-.3-.1-.7-.2-1.1-.2-.8 0-1.4.2-1.9.7-.5.5-.8 1.1-.9 1.9zM244.6 203.7c-.6 0-1.2 0-1.7-.1s-.9-.2-1.3-.4h-.1v-1.6l.2.1c.3.2.7.3 1.2.4.5.1 1 .2 1.5.2.7 0 1.2-.1 1.5-.4.3-.2.5-.5.5-.9 0-.2 0-.4-.1-.5-.1-.1-.2-.2-.4-.3-.2-.1-.4-.2-.7-.3-.3-.1-.6-.2-1-.3l-1.2-.4c-.4-.2-.7-.3-.9-.5-.3-.2-.5-.5-.6-.7-.1-.3-.2-.6-.2-1s.1-.7.2-1.1.4-.6.7-.9c.3-.2.7-.4 1.1-.6.4-.1 1-.2 1.5-.2s1 0 1.4.1c.4.1.8.2 1 .3h.1v1.5l-.2-.1c-.3-.1-.6-.2-1-.3-.4-.1-.9-.2-1.4-.2-.7 0-1.2.1-1.4.4-.3.2-.4.5-.4 1 0 .3.1.6.4.8.3.2.8.4 1.5.6l1.2.4c.4.1.7.3 1 .5.3.2.5.5.7.8.2.3.2.7.2 1.1 0 .3-.1.7-.2 1-.1.3-.3.6-.6.9-.3.3-.7.5-1.1.6-.3 0-.8.1-1.4.1zM262 203.5h-1.6v-5.6c0-.8-.2-1.4-.5-1.8-.3-.4-.8-.5-1.6-.5-.5 0-1 .1-1.5.2-.4.2-.8.3-1.1.5v7.1h-1.6v-14h1.6v5.3c.3-.2.7-.3 1.1-.4.6-.2 1.2-.3 1.8-.3 1.1 0 1.9.3 2.5.9.6.6.9 1.5.9 2.7v5.9zM268.3 203.7c-.7 0-1.3-.1-1.9-.3-.5-.2-1-.5-1.4-.9-.4-.4-.7-.9-.9-1.5-.2-.6-.3-1.2-.3-2s.1-1.4.3-2c.2-.6.5-1.1.9-1.6.4-.4.9-.8 1.4-1 .6-.2 1.2-.3 1.8-.3.7 0 1.3.1 1.8.3.5.2.9.6 1.2 1 .3.4.6.9.7 1.4.1.5.2 1.1.2 1.7v.9h-6.8c0 .4.1.7.2 1 .1.4.3.7.6 1 .2.3.6.5 1 .7.4.2.9.2 1.4.2.6 0 1.2-.1 1.7-.3.5-.2.9-.4 1.2-.5l.2-.1v1.6h-.1c-.4.2-.9.4-1.4.5-.4.1-1.1.2-1.8.2zm-2.9-5.6h5.2l-.1-.9c-.1-.3-.2-.6-.4-.9-.2-.2-.4-.4-.8-.6-.3-.1-.7-.2-1.1-.2-.8 0-1.4.2-1.9.7-.5.5-.8 1.1-.9 1.9zM275.5 203.5h-1.6v-8.7h.1c.5-.2 1-.3 1.6-.4.6-.1 1.2-.2 1.8-.2.4 0 .7 0 1 .1.3 0 .5.1.7.1h.1v1.5h-.2c-.1 0-.3-.1-.6-.1-.5-.1-1.3-.1-2.1 0-.3.1-.6.1-.8.2v7.5zM283.7 203.7c-.7 0-1.3-.1-1.9-.3-.5-.2-1-.5-1.4-.9-.4-.4-.7-.9-.9-1.5-.2-.6-.3-1.2-.3-2s.1-1.4.3-2c.2-.6.5-1.1.9-1.6.4-.4.9-.8 1.4-1 .6-.2 1.2-.3 1.8-.3.7 0 1.3.1 1.8.3.5.2.9.6 1.2 1 .3.4.6.9.7 1.4.1.5.2 1.1.2 1.7v.9h-6.8c0 .4.1.7.2 1 .1.4.3.7.6 1 .2.3.6.5 1 .7.4.2.9.2 1.4.2.6 0 1.2-.1 1.7-.3.5-.2.9-.4 1.2-.5l.2-.1v1.6h-.1c-.4.2-.9.4-1.4.5-.4.1-1 .2-1.8.2zm-2.8-5.6h5.2l-.1-.9c-.1-.3-.2-.6-.4-.9-.2-.2-.5-.4-.8-.6-.3-.1-.7-.2-1.1-.2-.8 0-1.4.2-1.9.7-.5.5-.8 1.1-.9 1.9zM289 194h-.5v-1.7h-.6v-.4h1.7v.4h-.6v1.7zM292 194h-.5v-1.2l-.5 1.2h-.4l-.5-1.1v1.2h-.5v-2.1h.5l.6 1.3.6-1.4h.5v2.1z" />
	  </svg>
    </div>
    <!-- end em-c-footer__inner -->
  </div>
  <!-- end em-l-container -->
</footer>
<!-- end em-c-footer -->

<!-- SCRIPTS -->
<script> // Filters 
function FilterTeam(){
var type= document.getElementsByName("toggleTeam");
if (type[0].checked) { 
	$("#FormsContainer").hide();
	$("#WorstCaseBtn").hide();
	$("#ESGContainer").hide();
	$("#IRTContainer").show();
	Team="IRT"
}
if (type[1].checked) {
	$("#FormsContainer").hide();
	$("#WorstCaseBtn").show();
	$("#IRTContainer").hide();
	$("#ESGContainer").show();
	Team="ESG"
}

}

function FilterEvents() {

var type= document.getElementsByName("toggleEventsType");
if (type[0].checked) { var IRTEvents= "ALL";}
else if (type[1].checked) {var IRTEvents= "Key Facts";}
else if (type[2].checked) {var IRTEvents= "Int Comms";}
else if (type[3].checked) {var IRTEvents= "Ext Comms";}

var table = document.getElementById("IRTEventsTable");

for (var i = 1, row; row = table.rows[i]; i++) {

table.rows[i].style.display = '';

if (IRTEvents=="ALL") {
    table.rows[i].style.display = '';
}

if (IRTEvents=="Key Facts") {
if (row.cells[4].innerHTML!='') {
    table.rows[i].style.display = '';
    }
    else {
    table.rows[i].style.display = 'None';
    }
}

if (IRTEvents=="Int Comms") {
if (row.cells[5].innerHTML!='') {
    table.rows[i].style.display = '';
    }
    else {
    table.rows[i].style.display = 'None';
    }
}

if (IRTEvents=="Ext Comms") {
if (row.cells[6].innerHTML!='') {
    table.rows[i].style.display = '';
    }
    else {
    table.rows[i].style.display = 'None';
    }
}

}
}

</script>
<script> // Button Clicks 
$("#HomeBtn").click(function(){FilterTeam();});

$("#BtnESG").click(function(){ActivateESG();});

$("#BtnCloseDevelopment").click(function(){$("#ModalDevelopment").hide();});

$("#EventsBtn").click(function(){
		FormMode="New";
		document.getElementById("EventsForm").reset();
		$("#EventsLegend").html("ADD NEW EVENT");
		$("#EventsSave").html("Submit Event");
		ShowForm("#EventsForm");
		
});

$("#ObjectivesBtn").click(function(){

		FormMode="New";				
var type= document.getElementsByName("toggleTeam");
if (type[0].checked) { 
		document.getElementById("IRTObjectivesForm").reset();
		$("#ObjectivesLegend").html("ADD NEW OBJECTIVE");
		$("#ObjectivesSave").html("Submit Objective");
		ShowForm("#IRTObjectivesForm");
}
if (type[1].checked) {		
		document.getElementById("ESGObjectivesForm").reset();
		$("#ObjectivesLegend").html("ADD NEW OBJECTIVE");
		$("#ObjectivesSave").html("Submit Objective");
		ShowForm("#ESGObjectivesForm");
}
});

$("#ActionsBtn").click(function(){

		FormMode="New";
		document.getElementById("ActionsForm").reset();
		$("#ActionsLegend").html("ADD NEW ACTION");
		$("#ActionsSave").html("Submit Action");
		ShowForm("#ActionsForm");
});

$("#WorstCaseBtn").click(function(){

		FormMode="New";
		document.getElementById("WorstCaseForm").reset();
		$("#WCSLegend").html("ADD NEW WORST CASE SCENARIO");
		$("#WCSSave").html("Submit Worst Case");
		ShowForm("#WorstCaseForm");
});

$("#TeamBtn").click(function(){
		FormMode="New";
		document.getElementById("TeamForm").reset();
		$("#TeamLegend").html("ADD NEW TEAM MEMBER");
		$("#TeamSave").html("Submit Contact");
		ShowForm("#TeamForm");
});

$("#DocumentsBtn").click(function(){ 
FormMode="New";
ShowForm("#KeyDocsForm");
});

$("#AlertBtn").click(function(){ 
document.getElementById('Alert').style.display = 'none';
});

function EditIncident() {
		FormMode="Edit";
		ShowForm("#IncidentForm");
}

</script>
<script> // Delete Items
function DeleteItem(ItemID, ListID) {

var retVal = confirm("You are about to delete this item. Do you want to continue?");
               if( retVal == true ) {
    switch(ListID) {
	case 0: 
		var list= "IRP Details";
		break;
	case 1:
		var list = "IRP Events";
		break;
	case 2:
		var list = "IRP Objectives";
		break;
	case 3:
		var list = "IRP Actions";
		break;
	case 4:
		var list = "IRP Worst Case Scenario";
		break;
	case 5:
		var list = "IRP Responding Team";
		break;
    }
	
	var clientContext = new SP.ClientContext(siteURL);
    var oList = clientContext.get_web().get_lists().getByTitle(list);

    this.oListItem = oList.getItemById(ItemID);

    oListItem.deleteObject();

    clientContext.executeQueryAsync(Function.createDelegate(this, this.onDeleteSucceeded), Function.createDelegate(this, this.onDeleteFailed));
  
               } 
			  
            }

function onDeleteSucceeded() {

   alert("Item Deleted. The page will quickly refresh to show the latest information.");
	var url = "https://ishareteam2.na.xom.com/sites/FMRE012/SitePages/IRP_Incident.aspx?ID=" + IncidentID + "&Team=" + Team
	window.location.href = url;
	
}

function onDeleteFailed(sender, args) {

    alert('Request failed. ' + args.get_message() + '\n' + args.get_stackTrace());
}
</script>
<script> // Reset Forms
function ResetForms(){
$('form').each(function() { this.reset() });

}

// Cancel Buttons
function CancelForms(){
ResetForms();
$("#HomeBtn").click();
}
</script>
<script> // Notifications 
// Create Emails
function CreateInternalEmail() {
    var Initiator = _spPageContextInfo.userId;
    var clientContext = new SP.ClientContext(siteURL);
    var oList = clientContext.get_web().get_lists().getByTitle('Workflow Starter');
    var itemCreateInfo = new SP.ListItemCreationInformation();
    this.oListItem = oList.addItem(itemCreateInfo);
   
    oListItem.set_item('Title', 'Internal Briefing Email' );
    oListItem.set_item('Parameter1', IncidentID);
    oListItem.set_item('Parameter2', '2');
    oListItem.set_item('Initiator', Initiator);
        
    oListItem.update();

    clientContext.load(oListItem);
    clientContext.executeQueryAsync(Function.createDelegate(this, this.onEmailSucceeded), Function.createDelegate(this, this.onQueryFailed));
}

function onEmailSucceeded() {

   alert('Draft Email created.\nPlease check your Inbox.');

}

</script>
<script> // Checkboxes and Radio Buttons 
function UpdateCheckboxes(){
	var checkboxTrigger = document.querySelectorAll('.em-js-checkbox-trigger');
	var checkboxChecked = document.querySelectorAll('.em-js-checkbox-trigger:checked');

	for (i=0; i<checkboxChecked.length; i++) {
		var checkboxParent = checkboxChecked[i].parentNode.parentNode;
		checkboxParent.classList.add('em-is-active');
	}
	
	var radioTrigger = document.querySelectorAll('.em-js-radio-trigger');
	var radioChecked =  document.querySelectorAll('.em-js-radio-trigger:checked');

	for (i=0; i<radioChecked.length; i++) {
		var radioParent = radioChecked[i].parentNode.parentNode;
		radioParent.classList.add('em-is-active'); /* 1 */
	}
		
}
</script>
<script> // Show Form
function ShowForm(FormName){
	$("#IRTContainer").hide();
	$("#ESGContainer").hide();
	$("#IRTObjectivesForm").hide();
	$("#ESGObjectivesForm").hide();
	$("#WorstCaseForm").hide();
	$("#ActionsForm").hide();
	$("#IncidentForm").hide();
	$("#EventsForm").hide();
	$("#TeamForm").hide();
	$("#KeyDocsForm").hide();
	$("#FormsContainer").show();
	$(FormName).show();
}
</script>
<script> // Activate ESG
function ActivateESG() {
var siteUrl = '/sites/FMRE012';
var list= "IRP Details";
var clientContext = new SP.ClientContext(siteUrl);
var oList = clientContext.get_web().get_lists().getByTitle(list); 	
this.oListItem = oList.getItemById(IncidentID);
oListItem.set_item('ActivateESG', true);
oListItem.update();
clientContext.executeQueryAsync(Function.createDelegate(this, this.onESGSucceeded), Function.createDelegate(this, this.onQueryFailed));
}
function onESGSucceeded() {	alert("ESG Workflow has started."); }
</script>
<script> // Create/Update List Items 
function UpdateListItem(ItemID, ListID) {

switch(ListID) {
	
	case 3:
		var AssignedName = document.getElementById("ActionAssigned").value;
		break;
	
	case 5:
		var AssignedName = document.getElementById("TeamContact").value;
		break;
}

GetID(AssignedName, ItemID, ListID);

}
	
function GetID(username, ItemID, ListID) {
    userID = 0;
	// begin work to call across network
    var requestUri = siteURL+"/_api/web/SiteUserInfoList/items?$select=Id&$filter=Title eq '"+username+"'";
    //execute AJAX request
    $.ajax({
        url: requestUri,
        type: "GET",
        headers: { "ACCEPT": "application/json;odata=verbose" },
        success: function (data) {
            if(data.d.results.length>0){
                userID=data.d.results[0].Id;
                <!-- console.log ("userID = " + userID); -->
				ExecuteUpdate(ItemID, ListID);
				return userID
            }
			else {
			ExecuteUpdate(ItemID, ListID);}

        },
        error: function () {
            alert("Failed to get user details. UserName = " + username);
        }
    });
	
};

function ExecuteUpdate(ItemID, ListID) {
var siteUrl = '/sites/FMRE012';

switch(ListID) {
	case 0:
		var list= "IRP Details";
		break;
	case 1:
		var list = "IRP Events";
		break;
	case 2:
		var list = "IRP Objectives";
		break;
	case 3:
		var list = "IRP Actions";
		break;
	case 4:
		var list = "IRP Worst Case Scenario";
		break;
	case 5:
		var list = "IRP Responding Team";
		break;
				}

//BOTH
	var clientContext = new SP.ClientContext(siteUrl);
    var oList = clientContext.get_web().get_lists().getByTitle(list); 	
//NEW
if (FormMode=="New") {
	var itemCreateInfo = new SP.ListItemCreationInformation();
    this.oListItem = oList.addItem(itemCreateInfo);
	}
//EDIT
if (FormMode=="Edit") {
	this.oListItem = oList.getItemById(ItemID);
	}
//BOTH	
switch(ListID) {
	case 0: //Incident
			
			var lstIncidentName = document.getElementById("frmIncidentName").value;
			oListItem.set_item('Title', lstIncidentName);
			
			var lstAlertedBy = document.getElementById("frmAlertedBy").value;
			oListItem.set_item('Alerted_x0020_By', lstAlertedBy);
			
			var lstIncidentStatus = document.getElementById("frmIncidentStatus").value;
			oListItem.set_item('Status', lstIncidentStatus);
			
			var lstStartDate = document.getElementById("frmIncidentDate").value;
			if (lstStartDate !== "") {
			lstStartDate = lstStartDate +"-06:00";
			oListItem.set_item('Incident_x0020_Start', lstStartDate);}
			
			var lstEndDate = document.getElementById("frmIncidentEndDate").value;
			if (lstEndDate !== "") {
			lstEndDate = lstEndDate +"-06:00";
			oListItem.set_item('IncidentEnd', lstEndDate);}
			
			var lstTimeZone = $('input[name=frmTZ]:checked').val();
			oListItem.set_item('Time_x0020_Zone', lstTimeZone); 
			
			var RBUcheckboxes = document.getElementsByName('frmRBU[]');
			var RBUvals = "";
				for (var i=0, n=RBUcheckboxes.length;i<n;i++) {
				if (RBUcheckboxes[i].checked) { RBUvals += ";"+RBUcheckboxes[i].value; }}
				if (RBUvals) RBUvals = RBUvals.substring(1);
			oListItem.set_item('Zone', RBUvals);
			
			var Functionscheckboxes = document.getElementsByName('frmFunctions[]');
			var Functionsvals = "";
				for (var i=0, n=Functionscheckboxes.length;i<n;i++) { 		
				if (Functionscheckboxes[i].checked) {  Functionsvals += ";"+Functionscheckboxes[i].value;		}}
				if (Functionsvals) Functionsvals = Functionsvals.substring(1);
			oListItem.set_item('Function', Functionsvals);
			
				var t = $("#CountriesGrid").find("div.fs-label").html();  
				oListItem.set_item('Countries', t);
							
				var VendorVals = new Array();
				var x = $("#VendorsGrid").find("div.selected");
				x.each(function() {
				$(this).data('value');
				var lookupVal = new SP.FieldLookupValue();
				var selectedvalue = $(this).data('value');
				lookupVal.set_lookupId(selectedvalue);
				VendorVals.push(lookupVal);
				});
				
				oListItem.set_item('Vendors0', VendorVals);
				
							
				
			var lstIncidentInfo = document.getElementById("frmIncidentInfo").value;  
			oListItem.set_item('Incident_x0020_Information', lstIncidentInfo);
				
			var lstRootCause = document.getElementById("frmRootCause").value;  
			oListItem.set_item('ows_Failed_x0020_Component', lstRootCause);
			
			var lstLessonsLearned = document.getElementById("frmLessonsLearned").value;  
			oListItem.set_item('ows_Lessons_x0020_Learned', lstLessonsLearned);
			
			var lstBusinessImpact = document.getElementById("frmBusinessImpact").value;
			oListItem.set_item('Business_x0020_Impact', lstBusinessImpact);
	
//			if ( document.getElementById("inputfile").files.length > 0) {
//	uploadDocument();
//	}
		break;
		
	case 1: //Events
			var Event = document.getElementById("EventTitle").value;
			oListItem.set_item('Title', Event);
			
			var KeyFact = $('input[name=EventKeyFact]:checked').val();
			if (KeyFact==1) {oListItem.set_item('Key_x0020_Fact', KeyFact); } else { oListItem.set_item('Key_x0020_Fact', 0); }
						
			var EventStartDate = document.getElementById("EventDate").value;
			if (EventStartDate !== "") { 
			EventStartDate = EventStartDate +"-06:00";
			oListItem.set_item('When', EventStartDate);}
		
			var EventTimeZone = $('input[name=EventTZ]:checked').val();
			oListItem.set_item('Time_x0020_Zone', EventTimeZone);
		
			var IntComm = $('input[name=EventIntComm]:checked').val();
			if (IntComm==1) {oListItem.set_item('Internal_x0020_Communication', IntComm); } else { oListItem.set_item('Internal_x0020_Communication', 0); }
			
			var ExtComm = $('input[name=EventExtComm]:checked').val();
			if (ExtComm==1) {oListItem.set_item('External_x0020_Communication', ExtComm); } else { oListItem.set_item('External_x0020_Communication', 0); }
			
			var Contact = document.getElementById("EventContact").value;
			oListItem.set_item('Contact', Contact);
			
			oListItem.set_item('IncidentID', IncidentID);
			oListItem.set_item('Response_x0020_Team', Team);
		break;
		
	case 2: //Objectives
			if (Team == 'IRT') {
			var Objective = document.getElementById("IRTObjective").value;
			oListItem.set_item('Title', Objective);
			
			var Tactics = document.getElementById("IRTTactics").value;
			oListItem.set_item('Tactics', Tactics);
			
			var Priority = $('input[name=IRTObjPriority]:checked').val();
			oListItem.set_item('Priority', Priority);
			
			var Goalcheckboxes = document.getElementsByName('IRTGoal[]');
			var Goalvals = "";
				for (var i=0, n=Goalcheckboxes.length;i<n;i++) {
				if (Goalcheckboxes[i].checked) { Goalvals += ";"+Goalcheckboxes[i].value; }}
				if (Goalvals) Goalvals = Goalvals.substring(1);
			oListItem.set_item('Goal', Goalvals);
						
			var Status = $('input[name=IRTStatus]:checked').val();
			oListItem.set_item('Status', Status);
			
			oListItem.set_item('IncidentID', IncidentID);
			oListItem.set_item('Response_x0020_Team', Team);
			}
			
			if (Team == 'ESG') {
			var Objective = document.getElementById("ESGObjective").value;
			oListItem.set_item('Title', Objective);
			
			var Tactics = document.getElementById("ESGTactics").value;
			oListItem.set_item('Tactics', Tactics);
			
			var Priority = $('input[name=ESGObjPriority]:checked').val();
			oListItem.set_item('Priority', Priority);
			
			var Goalcheckboxes = document.getElementsByName('ESGGoal[]');
			var Goalvals = "";
				for (var i=0, n=Goalcheckboxes.length;i<n;i++) {
				if (Goalcheckboxes[i].checked) { Goalvals += ";"+Goalcheckboxes[i].value; }}
				if (Goalvals) Goalvals = Goalvals.substring(1);
			oListItem.set_item('Goal', Goalvals);
			
			var PEARcheckboxes = document.getElementsByName('PEARcheck[]');
			var PEARvals = "";
				for (var i=0, n=PEARcheckboxes.length;i<n;i++) {
				if (PEARcheckboxes[i].checked) { PEARvals += ";"+PEARcheckboxes[i].value; }}
				if (PEARvals) PEARvals = PEARvals.substring(1);
			oListItem.set_item('PEAR', PEARvals);
			
			var Status = $('input[name=ESGStatus]:checked').val();
			oListItem.set_item('Status', Status);
			
			oListItem.set_item('IncidentID', IncidentID);
			oListItem.set_item('Response_x0020_Team', Team);
			}
		break;
		
	case 3: //Actions
			var UserVals = [];
			
			
			var Title = document.getElementById("ActionTitle").value;
			oListItem.set_item('Title', Title);
			
			
			var Priority = $('input[name=ActionPriority]:checked').val();
			oListItem.set_item('Priority', Priority);
			
			var Status = $('input[name=ActionStatus]:checked').val();
			oListItem.set_item('Status', Status);
						
			var StartDate = document.getElementById("ActionStartDate").value;
			if (StartDate!="") {StartDate = StartDate +"-06:00";
			oListItem.set_item('Start_x0020_Date', StartDate);}
			
			var DueDate = document.getElementById("ActionDueDate").value;
			if (DueDate!="") {DueDate = DueDate +"-06:00";
			oListItem.set_item('Due_x0020_Date', DueDate);}
					
			var TimeZone = $('input[name=ActionTZ]:checked').val();
			oListItem.set_item('Time_x0020_Zone', TimeZone);
		
			var Notes = document.getElementById("ActionNotes").value;
			oListItem.set_item('Notes', Notes);
			
			oListItem.set_item('IncidentID', IncidentID);
			oListItem.set_item('Response_x0020_Team', Team);
					
			if (userID !== 0) {
			oListItem.set_item('Assigned_x0020_To', userID);
			} 
			else {
			var EmptyUser = [];
			oListItem.set_item('Assigned_x0020_To', EmptyUser); }
		break;
		
	case 4: //WCS
			var Title = document.getElementById("WCSTitle").value;
			oListItem.set_item('Title', Title);
			
			var PEARcheckboxes = document.getElementsByName('WCSPEAR[]');
			var PEARvals = "";
				for (var i=0, n=PEARcheckboxes.length;i<n;i++) {
				if (PEARcheckboxes[i].checked) { PEARvals += ";"+PEARcheckboxes[i].value; }}
				if (PEARvals) PEARvals = PEARvals.substring(1);
			oListItem.set_item('PEAR', PEARvals);
			
			var Impact = $('input[name=WCSSeverity]:checked').val();
			oListItem.set_item('Impact', Impact);
			
			var Probability = $('input[name=WCSProbability]:checked').val();
			oListItem.set_item('Probability', Probability);
			
			oListItem.set_item('IncidentID', IncidentID);
		break;

	case 5: //Team
			var Position = $("#TeamPosition").val();
			oListItem.set_item('Title', Position);
			
			if (userID !== 0) {
			oListItem.set_item('Contact', userID);
			} 
			else {
			var EmptyUser = [];
			oListItem.set_item('Contact', EmptyUser); }
						
			oListItem.set_item('Team', Team);
			oListItem.set_item('IncidentID', IncidentID);
		break;		
				}

	oListItem.update();
	
//NEW	
 if (FormMode=="New") {
	clientContext.load(oListItem);
	}
	
//BOTH
	clientContext.executeQueryAsync(Function.createDelegate(this, this.onQuerySucceeded), Function.createDelegate(this, this.onQueryFailed));
	
}

function onQuerySucceeded() {

	alert("Item Saved Successfully. The page will quickly refresh to show the latest information.");
	var url = "https://ishareteam2.na.xom.com/sites/FMRE012/SitePages/IRP_Incident.aspx?ID=" + IncidentID + "&Team=" + Team
	window.location.href = url;
}

function onQueryFailed(sender, args) {

    alert('Request failed. ' + args.get_message() + '\n' + args.get_stackTrace());
}
</script>
<script> // Get List Data

function getIncidentListData(IncidentID) {

    $().SPServices({
        operation: "GetListItems",
        async: true,
        webURL: siteURL,
        listName: "IRP Details",
        CAMLViewFields:
            "<ViewFields>" +
            "<FieldRef Name='ID' />" +
            "<FieldRef Name='Title' />" +
            "<FieldRef Name='Incident_x0020_Start' />" +
            "<FieldRef Name='IncidentEnd' />" +
            "<FieldRef Name='Time_x0020_Zone' />" +
            "<FieldRef Name='Alerted_x0020_By' />" +
            "<FieldRef Name='Zone' />" +
            "<FieldRef Name='Function' />" +
            "<FieldRef Name='Countries' />" +
            "<FieldRef Name='Vendors0' />" +
            "<FieldRef Name='Status' />" +
            "<FieldRef Name='Business_x0020_Impact' />" +
            "<FieldRef Name='Lessons_x0020_Learned' />" +
            "<FieldRef Name='Failed_x0020_Component' />" +
            "<FieldRef Name='Incident_x0020_Information' />" +
            "</ViewFields>",
        CAMLQuery:
            "<Query><Where><Eq>" +
            "<FieldRef Name='ID' />" +
            "<Value Type='Number'>" + IncidentID + "</Value>" +
            "</Eq></Where></Query>",

        completefunc: function (xData) {

            var rows = $(xData.responseXML).SPFilterNode("z:row");
            if (rows.length == 0) return;

            var row = rows[0];

            // --- Extract values ---
            let Title = row.getAttribute("ows_Title")?.toUpperCase() || "";
            let IncidentStart = row.getAttribute("ows_Incident_x0020_Start") || "";
            let IncidentEnd = row.getAttribute("ows_IncidentEnd") || "";
            let TimeZone = row.getAttribute("ows_Time_x0020_Zone") || "";
            let AlertedBy = row.getAttribute("ows_Alerted_x0020_By") || "";
            let RBU = row.getAttribute("ows_Zone") || "";
            let Functions = row.getAttribute("ows_Function") || "";
            let Countries = row.getAttribute("ows_Countries") || "";
            let Vendors = row.getAttribute("ows_Vendors0") || "";
            let Status = row.getAttribute("ows_Status") || "";
            let IncidentInfo = row.getAttribute("ows_Incident_x0020_Information") || "";
            let BusinessImpact = row.getAttribute("ows_Business_x0020_Impact") || "";
            let RootCause = row.getAttribute("ows_Failed_x0020_Component") || "";
            let Lessons = row.getAttribute("ows_Lessons_x0020_Learned") || "";

            // --- Clean Vendor values (faster) ---
            Vendors = Vendors.replace(/[0-9]/g, "")
                             .replace(/;#;#/g, ", ")
                             .replace(";#", "");

            // --- Status Badge ---
            let StatusClass =
                Status === "Open"
                    ? '<span class="em-c-badge em-c-badge--negative">Open Incident</span>'
                    : '<span class="em-c-badge em-c-badge--positive">Closed Incident</span>';

            // Update incident name
            document.getElementById("IncidentName").innerText = Title;

            // Cache HTML strings to avoid multiple appends
            let detailsHTML = `
                <tr class="em-c-table__row">
                    <td>${IncidentStart}</td>
                    <td>${IncidentEnd}</td>
                    <td>${TimeZone}</td>
                    <td>${AlertedBy}</td>
                    <td>${RBU}</td>
                    <td>${Functions}</td>
                    <td>${Countries}</td>
                    <td>${Vendors}</td>
                </tr>`;

            let infoHTML = `
                <tr>
                    <td>${IncidentInfo}</td>
                    <td>${BusinessImpact}</td>
                    <td>${StatusClass}</td>
                    <td>#Edit</a></td>
                </tr>`;

            let rootHTML = `
                <tr>
                    <td>${RootCause}</td>
                    <td>${Lessons}</td>
                </tr>`;

            // Append HTML ONCE per table (much faster)
            $("#IRTDetailsTable").append(detailsHTML);
            $("#ESGDetailsTable").append(detailsHTML);

            $("#IRTInfoTable").append(infoHTML);
            $("#ESGInfoTable").append(infoHTML);

            $("#IRTRootCauseTable").append(rootHTML);
            $("#ESGRootCauseTable").append(rootHTML);

            $("#SummaryDetailsTable").append(`
                <tr>
                    <td>${IncidentInfo}</td>
                    <td>${RBU}</td>
                    <td>${Countries}</td>
                    <td>${Vendors}</td>
                    <td>${AlertedBy}</td>
                </tr>`);

            $("#ESGSummaryDetailsTable").append(`
                <tr>
                    <td>${IncidentInfo}</td>
                    <td>${RBU}</td>
                    <td>${Countries}</td>
                    <td>${Vendors}</td>
                    <td>${AlertedBy}</td>
                </tr>`);
        }
    });
}

function getEventsListData(IncidentID) {

    var url = siteURL +
      "/_api/web/lists/getByTitle('IRP Events')/items?" +
      "$filter=IncidentID eq '" + IncidentID + "'" +
      "&$orderby=When desc";

    $.ajax({
        url: url,
        method: "GET",
        headers: { "Accept": "application/json;odata=verbose" },
        success: function(data) {

            var IRT = "", ESG = "";
            var SumIRT_Int="", SumIRT_Ext="", SumIRT_Info="";
            var SumESG_Int="", SumESG_Ext="", SumESG_Info="";

            data.d.results.forEach(function(item) {

                var KeyFact = item.Key_x0020_Fact ? "✔" : "";
                var IntComm = item.Internal_x0020_Communication ? "✔" : "";
                var ExtComm = item.External_x0020_Communication ? "✔" : "";

                var row = `
                    <tr class="em-c-table__row">
                        <td>${item.Title}</td>
                        <td style="white-space: nowrap">${item.When}</td>
                        <td>${item.Time_x0020_Zone}</td>
                        <td>${item.Contact}</td>
                        <td>${KeyFact}</td>
                        <td>${IntComm}</td>
                        <td>${ExtComm}</td>
                        <td><a href="#" onclick="EditList(${item.Id},1)">✏️</a></td>
                        <td><a href="#" onclick="DeleteItem(${item.Id},1)">❌</a></td>
                    </tr>`;

                if (item.Response_x0020_Team === "IRT") {
                    IRT += row;
                    if (IntComm) SumIRT_Int += row;
                    if (ExtComm) SumIRT_Ext += row;
                    if (KeyFact) SumIRT_Info += row;

                } else if (item.Response_x0020_Team === "ESG") {
                    ESG += row;
                    if (IntComm) SumESG_Int += row;
                    if (ExtComm) SumESG_Ext += row;
                    if (KeyFact) SumESG_Info += row;
                }
            });

            $("#IRTEventsTable").append(IRT);
            $("#ESGEventsTable").append(ESG);

            $("#SummaryIntCommTable").append(SumIRT_Int);
            $("#SummaryExtCommTable").append(SumIRT_Ext);
            $("#SummaryInfoTable").append(SumIRT_Info);

            $("#ESGSummaryIntCommTable").append(SumESG_Int);
            $("#ESGSummaryExtCommTable").append(SumESG_Ext);
            $("#ESGSummaryInfoTable").append(SumESG_Info);
        }
    });
}

function getObjectivesListData(IncidentID) {

    var url = siteURL +
      "/_api/web/lists/getByTitle('IRP Objectives')/items?" +
      "$filter=IncidentID eq '" + IncidentID + "'" +
      "&$orderby=ID desc";

    $.ajax({
        url: url,
        method: "GET",
        headers: { "Accept": "application/json;odata=verbose" },

        success: function (data) {

            var IRT_HTML = "";
            var ESG_HTML = "";

            var SumIRT = "";
            var SumESG = "";

            data.d.results.forEach(function (item) {

                var rowIRT = `
                    <tr class="em-c-table__row" align="middle">
                        <td class="em-c-table__cell" align="left">${item.Title}</td>
                        <td class="em-c-table__cell" align="centre">${item.Priority}</td>
                        <td class="em-c-table__cell" align="left">${item.Tactics}</td>
                        <td class="em-c-table__cell" align="centre">${item.Goal}</td>
                        <td class="em-c-table__cell" align="centre">${item.Status}</td>
                        <td class="em-c-table__cell" align="left">
                            <a href="#" onclick="javascript:EditList(${item.ID},2);">
                                <svg class="em-c-icon em-c-icon--small em-c-icon--blue em-c-link-list__icon">
                                  <use xlink:href="/sites/FMRE012/SiteAssets/unity-1.3.0/images/em-icons.svg#pencil"></use>
                                </svg>
                            </a>
                        </td>
                        <td class="em-c-table__cell" align="left">
                            <a href="#" onclick="javascript:DeleteItem(${item.ID},2);">
                                <svg class="em-c-icon em-c-icon--small em-c-icon--red em-c-link-list__icon">
                                  <use xlink:href="/sites/FMRE012/SiteAssets/unity-1.3.0/images/em-icons.svg#circle-x"></use>
                                </svg>
                            </a>
                        </td>
                    </tr>
                `;

                var rowESG = `
                    <tr class="em-c-table__row" align="middle">
                        <td class="em-c-table__cell" align="centre">${item.PEAR}</td>
                        <td class="em-c-table__cell" align="left">${item.Title}</td>
                        <td class="em-c-table__cell" align="centre">${item.Priority}</td>
                        <td class="em-c-table__cell" align="left">${item.Tactics}</td>
                        <td class="em-c-table__cell" align="centre">${item.Goal}</td>
                        <td class="em-c-table__cell" align="centre">${item.Status}</td>
                        <td class="em-c-table__cell" align="left">
                            <a href="#" onclick="javascript:EditList(${item.ID},2);">
                                <svg class="em-c-icon em-c-icon--small em-c-icon--blue em-c-link-list__icon">
                                  <use xlink:href="/sites/FMRE012/SiteAssets/unity-1.3.0/images/em-icons.svg#pencil"></use>
                                </svg>
                            </a>
                        </td>
                        <td class="em-c-table__cell" align="left">
                            <a href="#" onclick="javascript:DeleteItem(${item.ID},2);">
                                <svg class="em-c-icon em-c-icon--small em-c-icon--red em-c-link-list__icon">
                                  <use xlink:href="/sites/FMRE012/SiteAssets/unity-1.3.0/images/em-icons.svg#circle-x"></use>
                                </svg>
                            </a>
                        </td>
                    </tr>
                `;

                var summaryIRT = `
                    <tr class="em-c-table__row" align="middle">
                        <td class="em-c-table__cell" align="left">${item.Title}</td>
                        <td class="em-c-table__cell" align="left">${item.Tactics}</td>
                        <td class="em-c-table__cell" align="centre">${item.Goal}</td>
                        <td class="em-c-table__cell" align="centre">${item.Status}</td>
                    </tr>
                `;

                var summaryESG = `
                    <tr class="em-c-table__row" align="middle">
                        <td class="em-c-table__cell" align="left">${item.PEAR}</td>
                        <td class="em-c-table__cell" align="left">${item.Title}</td>
                        <td class="em-c-table__cell" align="left">${item.Tactics}</td>
                        <td class="em-c-table__cell" align="centre">${item.Goal}</td>
                        <td class="em-c-table__cell" align="centre">${item.Status}</td>
                    </tr>
                `;

                // ROUTING
                if (item.Response_x0020_Team === "IRT") {
                    IRT_HTML += rowIRT;
                    if (item.Priority === "High") {
                        SumIRT += summaryIRT;
                    }
                }

                if (item.Response_x0020_Team === "ESG") {
                    ESG_HTML += rowESG;
                    if (item.Priority === "High") {
                        SumESG += summaryESG;
                    }
                }
            });

            // SINGLE APPENDS (FAST!)
            $("#IRTObjectivesTable").append(IRT_HTML);
            $("#ESGObjectivesTable").append(ESG_HTML);

			// 🔥 Compile the new HTML so Angular typeahead works
			var scope = angular.element(document.body).scope();
			var injector = angular.element(document.body).injector();
			var $compile = injector.get("$compile");

			$compile($("#IRTActionsTable"))(scope);
			$compile($("#ESGActionsTable"))(scope);

			scope.$applyAsync();  // safer than $apply()

            $("#SummaryObjTable").append(SumIRT);
            $("#ESGSummaryObjTable").append(SumESG);
        }
    });
}

function getActionsListData(IncidentID) {

    let url = siteURL +
        "/_api/web/lists/getByTitle('IRP Actions')/items?" +
        "$filter=IncidentID eq '" + IncidentID + "'" +
        "&$orderby=Start_x0020_Date desc" +
        "&$select=ID,Title,Priority,Start_x0020_Date,Due_x0020_Date,Time_x0020_Zone," +
        "Notes,Status,Response_x0020_Team,IncidentID," +
        "Assigned_x0020_To/Id,Assigned_x0020_To/Title,Assigned_x0020_To/EMail" +
        "&$expand=Assigned_x0020_To";

    return new Promise(function (resolve, reject) {

        $.ajax({
            url: url,
            method: "GET",
            headers: { "Accept": "application/json;odata=verbose" },

            success: function (data) {

                let scope = angular.element(document.body).scope();

                if (!scope.dft._rowUsers) scope.dft._rowUsers = {};
                if (!scope.dft.rowUsers) scope.dft.rowUsers = {};

                //-------------------------------------
                // Display name formatter
                //-------------------------------------
                scope.dft.getDisplayNames = function (arr) {
                    if (!Array.isArray(arr)) return "";
                    return arr.map(u => u.DisplayText).join(", ");
                };

                //-------------------------------------
                // FIXED — PEOPLE PICKER CHANGE HANDLER
                //-------------------------------------
                scope.dft.onUserChanged = function (id) {

					console.log("🔔 onUserChanged fired for:", id);
					console.log("Getter raw value:", scope.dft.rowUsers[id]);
					console.log("Getter() result:", scope.dft.rowUsersid);

                    // CALL GETTER CORRECTLY
                    let val = scope.dft.rowUsersid;

                    // During typing inside input, value will be string → ignore
                    if (!Array.isArray(val)) return;

                    // Trigger SharePoint save
                    $(`input[data-id='${id}'][data-field='Assigned_x0020_ToId']`)
                        .trigger("change");
                };

                //-------------------------------------
                // Build tables
                //-------------------------------------
                let IRT_HTML = "", ESG_HTML = "";

                data.d.results.forEach(function (item) {

                    // People picker array normalize
                    let assigned = (item.Assigned_x0020_To?.results || []).map(u => ({
                        DisplayText: u.Title,
                        Description: u.EMail,
                        EntityData: { SPUserID: u.Id }
                    }));

                    //-------------------------------------
                    // Getter/setter model
                    //-------------------------------------
                    scope.dft._rowUsers[item.ID] = assigned;

                    scope.dft.rowUsers[item.ID] = function (newVal) {
                        if (arguments.length) {
                            scope.dft._rowUsers[item.ID] = newVal;
                        }
                        return scope.dft._rowUsers[item.ID];
                    };

                    //-------------------------------------
                    // Build row
                    //-------------------------------------
                    let row = `
<tr class="em-c-table__row" data-item-id="${item.ID}">

    <td>
        <input type="text" class="edit-action-field"
            data-id="${item.ID}" data-field="Title"
            value="${item.Title || ''}">
    </td>

    <td>
        <input
            ng-model="dft.rowUsers[${item.ID}]"
            ng-change="dft.onUserChanged(${item.ID})"
            ng-model-options="{ debounce: { default: 300 }, getterSetter: true }"
            uib-typeahead="user as user.DisplayText for user in dft.searchSP($viewValue)"
            typeahead-min-length="1"
            pp-is-multiuser="true"
            placeholder="Pick a person"
            class="em-c-input people-picker-input edit-action-field"
            data-id="${item.ID}"
            data-field="Assigned_x0020_ToId">
    </td>

    <td>
        <select class="edit-action-field" data-id="${item.ID}" data-field="Priority">
            <option value="High"   ${item.Priority=="High"?"selected":""}>High</option>
            <option value="Medium" ${item.Priority=="Medium"?"selected":""}>Medium</option>
            <option value="Low"    ${item.Priority=="Low"?"selected":""}>Low</option>
        </select>
    </td>

    <td>
        <input type="date" class="edit-action-field"
            data-id="${item.ID}" data-field="Start_x0020_Date"
            value="${item.Start_x0020_Date ? item.Start_x0020_Date.split("T")[0] : ''}">
    </td>

    <td>
        <input type="date" class="edit-action-field"
            data-id="${item.ID}" data-field="Due_x0020_Date"
            value="${item.Due_x0020_Date ? item.Due_x0020_Date.split("T")[0] : ''}">
    </td>

    <td>
        <input type="text" class="edit-action-field"
            data-id="${item.ID}" data-field="Time_x0020_Zone"
            value="${item.Time_x0020_Zone || ''}">
    </td>

    <td>
        <textarea class="edit-action-field"
            data-id="${item.ID}" data-field="Notes">${item.Notes || ""}</textarea>
    </td>

    <td>
        <select class="edit-action-field" data-id="${item.ID}" data-field="Status">
            <option value="Open"       ${item.Status=="Open"?"selected":""}>Open</option>
            <option value="Completed"  ${item.Status=="Completed"?"selected":""}>Completed</option>
            <option value="Closed"     ${item.Status=="Closed"?"selected":""}>Closed</option>
        </select>
    </td>

</tr>`;

                    if (item.Response_x0020_Team === "IRT") IRT_HTML += row;
                    else ESG_HTML += row;
                });

                //-------------------------------------
                // Compile Angular
                //-------------------------------------
                $("#IRTActionsTable").append(IRT_HTML);
                $("#ESGActionsTable").append(ESG_HTML);

                let injector = angular.element(document).injector();
                let $compile = injector.get("$compile");

                $compile($("#IRTActionsTable")[0].children)(scope);
                $compile($("#ESGActionsTable")[0].children)(scope);

                scope.$applyAsync();

                //-------------------------------------
                // Apply save listeners
                //-------------------------------------
                attachActionEditListeners();

                //-------------------------------------
                // Show readable names in the input
                //-------------------------------------
                setTimeout(() => {
                    Object.keys(scope.dft._rowUsers).forEach(id => {
                        const arr = scope.dft._rowUsers[id];
                        const input = document.querySelector(`input[data-id="${id}"][data-field="Assigned_x0020_ToId"]`);
                        if (input) input.value = scope.dft.getDisplayNames(arr);
                    });
                }, 100);

                resolve();
            },

            error: reject
        });
    });
}

function updateActionField(itemId, fieldName, fieldValue) {
    console.log("updateaction field SAVE DEBUG:", fieldName, fieldValue);

    let url = siteURL + "/_api/web/lists/getByTitle('IRP Actions')/items(" + itemId + ")";

    let body = {
        "__metadata": { "type": "SP.Data.IRP_x0020_ActionsListItem" }
    };

    if (fieldName === "Assigned_x0020_ToId") {

        let arr = [];

        if (Array.isArray(fieldValue)) arr = fieldValue;
        else if (fieldValue && typeof fieldValue === "object") arr = [fieldValue];

        let clean = arr.filter(u =>
            u && u.EntityData && u.EntityData.SPUserID
        );

        body[fieldName] = { results: clean.map(u => parseInt(u.EntityData.SPUserID)) };
    }

    else if (fieldName.includes("Date") && fieldValue) {
        body[fieldName] = new Date(fieldValue).toISOString();
    }

    else {
        body[fieldName] = fieldValue;
    }

    return $.ajax({
        url: url,
        method: "POST",
        headers: {
            "Accept": "application/json;odata=verbose",
            "Content-Type": "application/json;odata=verbose",
            "X-RequestDigest": $("#__REQUESTDIGEST").val(),
            "X-HTTP-Method": "MERGE",
            "If-Match": "*"
        },
        data: JSON.stringify(body)
    });
}

function attachActionEditListeners() {

    $(".edit-action-field").off("change").on("change", function () {

        let el = $(this);
        let itemId = el.data("id");
        let fieldName = el.data("field");

        let valuePromise;

        //--------------------------------------------------
        // SPECIAL CASE: PEOPLE PICKER with blank/invalid support
        //--------------------------------------------------
        //--------------------------------------------------
		// SPECIAL CASE: PEOPLE PICKER with blank-safe logic
		//--------------------------------------------------
		if (fieldName === "Assigned_x0020_ToId") {

			valuePromise = new Promise((resolve, reject) => {

				let elPicker = $(`input[data-id='${itemId}'][data-field='Assigned_x0020_ToId']`);
				let ngModel = angular.element(elPicker).controller("ngModel");

				let attempts = 0;

				function waitForPickerObject() {
					attempts++;

					let raw = ngModel?.$$rawModelValue;

					// ⭐ CASE 1: User cleared the field completely → save blank
					if (raw === "" || raw === null || raw === undefined) {
						console.warn("⚠ Blank Assigned To — save empty.");
						resolve([]);  // empty people field
						return;
					}

					// ⭐ CASE 2: Valid user object
					if (typeof raw === "object" && raw.Key) {
						resolve(raw);
						return;
					}

					// ⭐ CASE 3: String but not empty → WAIT (typeahead is still resolving)
					if (typeof raw === "string" && raw.trim() !== "") {
						if (attempts < 20) {
							return setTimeout(waitForPickerObject, 50);
						}

						console.warn("⚠ Warning: picker never resolved object, saving empty.");
						resolve([]); // fallback blank after timeout
						return;
					}

					// Fallback safety
					if (attempts < 20) {
						return setTimeout(waitForPickerObject, 50);
					}

					console.error("❌ Picker failed — saving empty.");
					resolve([]);
				}

				waitForPickerObject();
			})
			.then(raw => {

				// Blank → return empty array (skip ensureuser)
				if (Array.isArray(raw) && raw.length === 0) {
					return [];
				}

				// Valid → ensureuser
				return $.ajax({
					url: siteURL + "/_api/web/ensureuser",
					method: "POST",
					headers: {
						"Accept": "application/json;odata=verbose",
						"Content-Type": "application/json;odata=verbose",
						"X-RequestDigest": $("#__REQUESTDIGEST").val()
					},
					data: JSON.stringify({ logonName: raw.Key })
				})
				.then(res => {
					let spId = res.d.Id;
					console.log("🎯 RESOLVED SPUserID:", spId);
					return [{ EntityData: { SPUserID: spId }}];
				});
			});
		}
		
		
        //--------------------------------------------------
        // NORMAL FIELDS
        //--------------------------------------------------
        else {
            valuePromise = Promise.resolve(el.val());
        }

        //--------------------------------------------------
        // UNIFIED SAVE
        //--------------------------------------------------
        el.addClass("saving");

        valuePromise
            .then(finalValue => updateActionField(itemId, fieldName, finalValue))
            .then(() => {
                el.removeClass("saving").addClass("saved");
                setTimeout(() => el.removeClass("saved"), 800);
            })
            .catch(err => {
                console.error("Failed to save:", err);
                el.addClass("error");
            });
    });
}

function getWorstCaseListData(IncidentID) {

    var url = siteURL +
      "/_api/web/lists/getByTitle('IRP Worst Case Scenario')/items?" +
      "$filter=IncidentID eq '" + IncidentID + "'" +
      "&$orderby=ID desc";

    $.ajax({
        url: url,
        method: "GET",
        headers: { "Accept": "application/json;odata=verbose" },

        success: function (data) {

            var TableHTML = "";
            var SummaryHTML = "";

            data.d.results.forEach(function (item) {

                TableHTML += `
                    <tr class="em-c-table__row" align="middle">
                        <td class="em-c-table__cell" align="left">${item.PEAR || ""}</td>
                        <td class="em-c-table__cell" align="left">${item.Title || ""}</td>
                        <td class="em-c-table__cell" align="left">${item.Impact || ""}</td>
                        <td class="em-c-table__cell" align="left">${item.Probability || ""}</td>
                        <td class="em-c-table__cell" align="left">
                            #
                                <svg class="em-c-icon em-c-icon--small em-c-icon--blue em-c-link-list__icon">
                                   /sites/FMRE012/SiteAssets/unity-1.3.0/images/em-icons.svg#pencil</use>
                                </svg>
                            </a>
                        </td>
                        <td class="em-c-table__cell" align="left">
                            #
                                <svg class="em-c-icon em-c-icon--small em-c-icon--red em-c-link-list__icon">
                                   /sites/FMRE012/SiteAssets/unity-1.3.0/images/em-icons.svg#circle-x</use>
                                </svg>
                            </a>
                        </td>
                    </tr>
                `;

                SummaryHTML += `
                    <tr class="em-c-table__row" align="middle">
                        <td class="em-c-table__cell" align="left">${item.PEAR || ""}</td>
                        <td class="em-c-table__cell" align="left">${item.Title || ""}</td>
                        <td class="em-c-table__cell" align="left">${item.Impact || ""}</td>
                        <td class="em-c-table__cell" align="left">${item.Probability || ""}</td>
                    </tr>
                `;
            });

            // Single fast append
            $("#ESGWCSTable").append(TableHTML);
            $("#ESGSummaryWCSTable").append(SummaryHTML);
        }
    });
}	   

function getRespondingTeamListData(IncidentID) {

    var url = $().SPServices.SPGetCurrentSite() +
        "/_api/web/lists/getByTitle('IRP Responding Team')/items?" +
        "$filter=IncidentID eq '" + IncidentID + "'" +
        "&$orderby=Title asc" +
        "&$select=ID,Title,Team,IncidentID,ContactEmail,Contact/Title,Contact/Id" +
        "&$expand=Contact";

    $.ajax({
        url: url,
        method: "GET",
        async: true,
        headers: { "Accept": "application/json;odata=verbose" },

        success: function (data) {

            let IRT_HTML = "";
            let ESG_HTML = "";
            let SUM_IRT = "";
            let SUM_ESG = "";

            data.d.results.forEach(function (item) {

                // Correct fields
                let Position = item.Title || "";
                let Contact = item.Contact ? item.Contact.Title : "";
                let Email = item.ContactEmail || "";
                let Team = item.Team || "";
                let ContactID = item.ID;

                // Table row
                let row = `
                    <tr class="em-c-table__row" align="middle">
                        <td class="em-c-table__cell" align="left">${Position}</td>
                        <td class="em-c-table__cell" align="left">${Contact}</td>
                        <td class="em-c-table__cell" align="left">
                            <a href="sip:${Email}">
                                <svg class="em-c-icon em-c-icon--medium em-c-link-list__icon">
                                    <use xlink:href="/sites/FMRE012/SiteAssets/unity-1.3.0/images/em-icons.svg#comment"></use>
                                </svg>
                            </a>
                        </td>
                        <td class="em-c-table__cell" align="left">
                            <a href="mailto:${Email}">
                                <svg class="em-c-icon em-c-icon--medium em-c-link-list__icon">
                                    <use xlink:href="/sites/FMRE012/SiteAssets/unity-1.3.0/images/em-icons.svg#envelope-open"></use>
                                </svg>
                            </a>
                        </td>
                        <td class="em-c-table__cell" align="left">
                            <a href="#" onclick="javascript:EditList(${ContactID},5);">
                                <svg class="em-c-icon em-c-icon--small em-c-icon--blue em-c-link-list__icon">
                                    <use xlink:href="/sites/FMRE012/SiteAssets/unity-1.3.0/images/em-icons.svg#pencil"></use>
                                </svg>
                            </a>
                        </td>
                        <td class="em-c-table__cell" align="left">
                            <a href="#" onclick="javascript:DeleteItem(${ContactID},5);">
                                <svg class="em-c-icon em-c-icon--small em-c-icon--red em-c-link-list__icon">
                                    <use xlink:href="/sites/FMRE012/SiteAssets/unity-1.3.0/images/em-icons.svg#circle-x"></use>
                                </svg>
                            </a>
                        </td>
                    </tr>
                `;

                // Summary row
                let summary = `
                    <tr class="em-c-table__row" align="middle">
                        <td class="em-c-table__cell" align="left">${Position}</td>
                        <td class="em-c-table__cell" align="left">${Contact}</td>
                    </tr>
                `;

                if (Team === "IRT") {
                    IRT_HTML += row;
                    SUM_IRT += summary;
                }

                if (Team === "ESG") {
                    ESG_HTML += row;
                    SUM_ESG += summary;
                }
            });

            // BATCH append for speed
            $("#IRTRespondingTeamTable").append(IRT_HTML);
            $("#SummaryTeamTable").append(SUM_IRT);

            $("#ESGRespondingTeamTable").append(ESG_HTML);
            $("#ESGSummaryTeamTable").append(SUM_ESG);
        }
    });
}


function getKeyDocsListData(IncidentID) {

    var url = $().SPServices.SPGetCurrentSite() +
        "/_api/web/lists/getByTitle('IRP Key Documents')/items?" +
        "$filter=IncidentID eq '" + IncidentID + "'" +
        "&$orderby=Modified desc";

    $.ajax({
        url: url,
        method: "GET",
        headers: { "Accept": "application/json;odata=verbose" },

        success: function (data) {

            var IRT_HTML = "";
            var ESG_HTML = "";

            data.d.results.forEach(function (item) {

                var Title = item.LinkFilename || "";
                var RelatedTo = item.Related_x0020_To || "";
                var Keywords = item.Keywords || "";
                var Modified = item.Modified || "";
                var ModifiedBy = item.Editor || "";
                var FileLink = (item.ServerUrl || "") + "?Web=1";
                var Response = item.Response_x0020_Team;

                // Clean ModifiedBy
                ModifiedBy = ModifiedBy.replace(";#", "").replace(/[0-9]/g, "");

                var row = `
                    <tr class="em-c-table__row" align="middle">
                        <td class="em-c-table__cell" align="left">
                            <a href="${FileLink}" target="_blank">View</a>
                        </td>
                        <td class="em-c-table__cell" align="left">${Title}</td>
                        <td class="em-c-table__cell" align="left">${RelatedTo}</td>
                        <td class="em-c-table__cell" align="left">${Keywords}</td>
                        <td class="em-c-table__cell" align="left">${Modified}</td>
                        <td class="em-c-table__cell" align="left">${ModifiedBy}</td>
                    </tr>
                `;

                if (Response === "IRT") {
                    IRT_HTML += row;
                }

                if (Response === "ESG") {
                    ESG_HTML += row;
                }
            });

            // FAST APPEND
            $("#IRTKeyDocsTable").append(IRT_HTML);
            $("#ESGKeyDocsTable").append(ESG_HTML);
        }
    });
}

function getCountryListData() {

    var url = $().SPServices.SPGetCurrentSite() +
        "/_api/web/lists/getByTitle('SP Countries')/items?" +
        "$orderby=Title asc";

    $.ajax({
        url: url,
        method: "GET",
        async: true,
        headers: { "Accept": "application/json;odata=verbose" },

        success: function (data) {

            var select = document.getElementById("Countries");
            var fragment = document.createDocumentFragment();

            data.d.results.forEach(function (item) {

                var Country = item.Title || "";
                var option = document.createElement("option");
                option.text = Country;
                option.value = item.ID;

                if (CountriesArray.includes(Country)) {
                    option.selected = true;
                }

                fragment.appendChild(option);
            });

            // Single fast append
            select.appendChild(fragment);
        }
    });
}

function getVendorListData() {

    var url = $().SPServices.SPGetCurrentSite() +
        "/_api/web/lists/getByTitle('PLSO Vendor Master')/items?" +
        "$orderby=Title asc";

    $.ajax({
        url: url,
        method: "GET",
        async: true,
        headers: { "Accept": "application/json;odata=verbose" },

        success: function (data) {

            var select = document.getElementById("Vendors");
            var fragment = document.createDocumentFragment();

            data.d.results.forEach(function (item) {

                var Vendor = item.Title || "";
                var option = document.createElement("option");
                option.text = Vendor;
                option.value = item.ID;

                if (VendorsArray.includes(Vendor)) {
                    option.selected = true;
                }

                fragment.appendChild(option);
            });

            // Append all at once — fast
            select.appendChild(fragment);
        }
    });
}

</script>
<script> // Edit Function
function EditList(ItemID, ListID){
ResetForms();
FormMode = "Edit";
EditID=ItemID;

var method = "GetListItems";                 
        var webURL =  siteURL ;                                                  
        var fieldsToRead = "<ViewFields>"+"<FieldRef Name='Name' />" +"</ViewFields>";
        var query = "<Query><OrderBy><FieldRef Name='ID'  Ascending='True' /></OrderBy></Query>";                      
		var query = "<Query><Where><Eq><FieldRef Name='ID' /><Value Type='Text'>" + ItemID + "</Value></Eq></Where><OrderBy><FieldRef Name='ID' Ascending='False'/></OrderBy></Query>";               
		
switch(ListID) {
	case 0:
		var list= "IRP Details";
		$("#IncidentLegend").html("EDIT INCIDENT");
		$("#IncidentSave").html("Update Incident");
		break;
	case 1:
		var list = "IRP Events";
		$("#EventsLegend").html("EDIT EVENT");
		$("#EventsSave").html("Update Event");
		break;
	case 2:
		var list = "IRP Objectives";
		$("#ObjectivesLegend").html("EDIT OBJECTIVE");
		$("#ObjectivesSave").html("Update Objective");
		break;
	case 3:
		var list = "IRP Actions";
		$("#ActionsLegend").html("EDIT ACTION");
		$("#ActionsSave").html("Update Action");
		break;
	case 4:
		var list = "IRP Worst Case Scenario";
		$("#WCSLegend").html("EDIT WORST CASE SCENARIO");
		$("#WCSSave").html("Update Worst Case");
		break;
	case 5:
		var list = "IRP Responding Team";
		$("#TeamLegend").html("EDIT TEAM MEMBER");
		$("#TeamSave").html("Update Team Member");
		break;
	
				}
		
$().SPServices  ({
                    operation: method,
                    async: false, 
                    webURL: webURL,
                    listName: list,
                    CAMLViewFields: "<ViewFields Properties='True' />",
                    CAMLQuery: query,                                                                                     
                    completefunc: function (xData, Status)
                     {
                         $(xData.responseXML).SPFilterNode("z:row").each(function() 
                         {
                              
switch(ListID) {

	case 0: //Incident
							  var Incident = $(this).attr("ows_Title");						  
							  var IncidentStart = $(this).attr("ows_Incident_x0020_Start");
							  var IncidentEnd = $(this).attr("ows_IncidentEnd");
							  var AlertedBy = $(this).attr("ows_Alerted_x0020_By");
							  var RBU = $(this).attr("ows_Zone");
							  var FunctionsCheck = $(this).attr("ows_Function");
							  var Countries = $(this).attr("ows_Countries");
							  var Vendors = $(this).attr("ows_Vendors");
							  var Status = $(this).attr("ows_Status");
							  var TimeZone = $(this).attr("ows_Time_x0020_Zone");
					
							  var IncidentInfo = $(this).attr("ows_Incident_x0020_Information");
							  var BusinessImpact = $(this).attr("ows_Business_x0020_Impact");
							  
							  var RootCause = $(this).attr("ows_Failed_x0020_Component");
							  var LessonsLearned = $(this).attr("ows_Lessons_x0020_Learned");
							  
							  $("#frmIncidentName").val(Incident);
							  $("#frmIncidentDate").val(IncidentStart);
							  $("#frmIncidentEndDate").val(IncidentEnd);
							  $("#frmAlertedBy").val(AlertedBy);
							  if(RBU.indexOf('AP') !== -1) {$("#RBUcheck-1").click(); };
							  if(RBU.indexOf('EA') !== -1) {$("#RBUcheck-2").click(); };
							  if(RBU.indexOf('NA') !== -1) {$("#RBUcheck-3").click(); };
							  
							  if (FunctionsCheck !== undefined) { 
							  if(FunctionsCheck.indexOf('Payments') !== -1) {$("#Functionscheck-1").click(); };
							  if(FunctionsCheck.indexOf('Loyalty') !== -1) {$("#Functionscheck-2").click(); };
							  };
							  if (TimeZone !== undefined) {
							  if (TimeZone.indexOf('CST') !== -1) { $("#TZ-1").click(); };
							  if (TimeZone.indexOf('CET') !== -1) { $("#TZ-2").click(); };
							  if (TimeZone.indexOf('ICT') !== -1) { $("#TZ-3").click(); };
							  }
						
							  $("#frmIncidentInfo").val(IncidentInfo);
							  $("#frmBusinessImpact").val(BusinessImpact);
							  $("#frmRootCause").val(RootCause);
							  $("#frmLessonsLearned").val(LessonsLearned);	
							  														  
EditIncident();
break;	
	
	case 1: //Events
							  var EventID = $(this).attr("ows_ID");
							  var EventTitle = $(this).attr("ows_Title");
							  var EventDate = $(this).attr("ows_When");
							  <!-- var EventDate = When.substring(0,10); -->
							  var Contact = $(this).attr("ows_Contact");                              
							  var TimeZone = $(this).attr("ows_Time_x0020_Zone");
							  var KeyFact = $(this).attr("ows_Key_x0020_Fact");
							  var IntComm = $(this).attr("ows_Internal_x0020_Communication");
							  var ExtComm = $(this).attr("ows_External_x0020_Communication");
							  var RTeam = $(this).attr("ows_Response_x0020_Team");				 
							  							  
							  $("#EventTitle").val(EventTitle);
							  $("#EventDate").val(EventDate);
							  $("#EventContact").val(Contact);
							  if (KeyFact == 1) { $("#EventKeyFact").click(); };
							  if (IntComm == 1) { $("#EventIntComm").click(); };
							  if (ExtComm == 1) { $("#EventExtComm").click(); };
							  if (TimeZone == "CST") { $("#EventTZ-1").click(); };
							  if (TimeZone == "CET") { $("#EventTZ-2").click(); };
							  if (TimeZone == "ICT") { $("#EventTZ-3").click(); };
							  $("#EventLegend").html("EDIT EVENT");
							  $("#EventSave").html("Update Event");
		
ShowForm("#EventsForm");
break;

	case 2: //Objectives
							  var ObjectiveID = $(this).attr("ows_ID");
							  var PEAR = $(this).attr("ows_PEAR");
							  var Objective = $(this).attr("ows_Title");
							  var Priority = $(this).attr("ows_Priority");
                              var Tactic = $(this).attr("ows_Tactics");
							  var Goal = $(this).attr("ows_Goal");
							  var Status = $(this).attr("ows_Status");
							  var RTeam = $(this).attr("ows_Response_x0020_Team");
							  
						if (RTeam=="ESG") {
							  $("#ESGObjective").val(Objective);
							  if (PEAR !== undefined) {
							  if(PEAR.indexOf('People') !== -1) {$("#PEARcheck-1").click(); };
							  if(PEAR.indexOf('Environment') !== -1) {$("#PEARcheck-2").click(); };
							  if(PEAR.indexOf('Assets') !== -1) {$("#PEARcheck-3").click(); };
							  if(PEAR.indexOf('Reputation') !== -1) {$("#PEARcheck-4").click(); };
							  }
							  if (Priority !== undefined) {
							  if (Priority == "High") { $("#ESGObjPriority-1").click(); };
							  if (Priority == "Medium") { $("#ESGObjPriority-2").click(); };
							  if (Priority == "Low") { $("#ESGObjPriority-3").click(); };
							  }
							  $("#ESGTactics").val(Tactic);
							  if (Goal !== undefined) {
							  if(Goal.indexOf('Control the Source') !== -1) {$("#ESGGoal-1").click(); };
							  if(Goal.indexOf('Manage the Response') !== -1) {$("#ESGGoal-2").click(); };
							  }
							  if(Status.indexOf('Not Started') !== -1) {$("#ESGStatus-1").click(); };
							  if(Status.indexOf('In Progress') !== -1) {$("#ESGStatus-2").click(); };
							  if(Status.indexOf('Completed') !== -1) {$("#ESGStatus-3").click(); };
							  
							  ShowForm("#ESGObjectivesForm");
						}
						
						if (RTeam=="IRT") {
							  $("#IRTObjective").val(Objective);
							  if (Priority !== undefined) {
							  if (Priority == "High") { $("#IRTObjPriority-1").click(); };
							  if (Priority == "Medium") { $("#IRTObjPriority-2").click(); };
							  if (Priority == "Low") { $("#IRTObjPriority-3").click(); };
							  }
							  $("#IRTTactics").val(Tactic);
							  if (Goal !== undefined) {
							  if(Goal.indexOf('Control the Source') !== -1) {$("#IRTGoal-1").click(); };
							  if(Goal.indexOf('Manage the Response') !== -1) {$("#IRTGoal-2").click(); };
							  }
							  if(Status.indexOf('Not Started') !== -1) {$("#IRTStatus-1").click(); };
							  if(Status.indexOf('In Progress') !== -1) {$("#IRTStatus-2").click(); };
							  if(Status.indexOf('Completed') !== -1) {$("#IRTStatus-3").click(); };
							  ShowForm("#IRTObjectivesForm");
						}
	

break;	

	case 3: //Actions
							  var ActionID = $(this).attr("ows_ID");
							  var Actions = $(this).attr("ows_Title");
							  
							  var AssignedTo = $(this).attr("ows_Assigned_x0020_To");
							  if (AssignedTo !== undefined) { 
								AssignedTo = AssignedTo.replace(';#',"");
								AssignedTo = AssignedTo.replace(/[0-9]/g,""); }
							  							  
                              var StartDate = $(this).attr("ows_Start_x0020_Date");
							  var DueDate = $(this).attr("ows_Due_x0020_Date");
							  var TimeZone = $(this).attr("ows_Time_x0020_Zone");
							  var Notes = $(this).attr("ows_Notes");
							  var Status = $(this).attr("ows_Status");
							  var RTeam = $(this).attr("ows_Response_x0020_Team");
							  var Priority = $(this).attr("ows_Priority");
							  
							  $("#ActionTitle").val(Actions);
							  $("#ActionAssigned").val(AssignedTo);
							  if(Status.indexOf('Not Started') !== -1) {$("#ActionStatus-1").click(); };
							  if(Status.indexOf('In Progress') !== -1) {$("#ActionStatus-2").click(); };
							  if(Status.indexOf('Completed') !== -1) {$("#ActionStatus-3").click(); };
							  if (Priority !== undefined) {
							  if(Priority.indexOf('High') !== -1) {$("#ActionPriority-1").click(); };
							  if(Priority.indexOf('Medium') !== -1) {$("#ActionPriority-2").click(); };
							  if(Priority.indexOf('Low') !== -1) {$("#ActionPriority-3").click(); };
							  }
							  $("#ActionStartDate").val(StartDate);
							  $("#ActionDueDate").val(DueDate);
							  if (TimeZone == "CST") { $("#ActionTZ-1").click(); };
							  if (TimeZone == "CET") { $("#ActionTZ-2").click(); };
							  if (TimeZone == "ICT") { $("#ActionTZ-3").click(); };
							  $("#ActionNotes").val(Notes);
							  
	
ShowForm("#ActionsForm");
break;	

	case 4: //Worst Case Scenario
							  var WCSID = $(this).attr("ows_ID");
							  var Scenario = $(this).attr("ows_Title");							
							  var PEAR = $(this).attr("ows_PEAR");
							  var Impact = $(this).attr("ows_Impact");
							  var Probability = $(this).attr("ows_Probability");
							  
							  $("#WCSTitle").val(Scenario);
							  if (PEAR !== undefined){
							  if(PEAR.indexOf('People') !== -1) {$("#WCSPEAR-1").click(); };
							  if(PEAR.indexOf('Environment') !== -1) {$("#WCSPEAR-2").click(); };
							  if(PEAR.indexOf('Assets') !== -1) {$("#WCSPEAR-3").click(); };
							  if(PEAR.indexOf('Reputation') !== -1) {$("#WCSPEAR-4").click(); };
							  }
							  if (Impact !== undefined) {
							  if (Impact == "High") { $("#WCSSeverity-1").click(); };
							  if (Impact == "Medium") { $("#WCSSeverity-2").click(); };
							  if (Impact == "Low") { $("#WCSSeverity-3").click(); };
							  }
							  if (Probability !== undefined) {
							  if (Probability == "High") { $("#WCSProbability-1").click(); };
							  if (Probability == "Medium") { $("#WCSProbability-2").click(); };
							  if (Probability == "Low") { $("#WCSProbability-3").click(); };
							  }
	
ShowForm("#WorstCaseForm");
break;	

		case 5: //Responding Team
							  var Contact = $(this).attr("ows_Contact");
							  if (Contact !== undefined) {
							  Contact = Contact.replace(';#',"");
							  Contact = Contact.replace(/[0-9]/g,""); }
							  var Position = $(this).attr("ows_Title");
							  $("#TeamContact").val(Contact);
							  $("#TeamPosition").val(Position);
	
ShowForm("#TeamForm");
break;	


		}
	});
   }
 }); 
       
//UpdateCheckboxes();
}
</script>
<script> // Create Email
function CreateEmail(EmailType) {
 
 var RBUDetails = escape(document.getElementById('RBUDetails').innerHTML);
 var IncidentInfo = escape(document.getElementById('IncidentInfoDetails').innerHTML);
 var BusinessImpact = escape(document.getElementById('BusinessImpactDetails').innerHTML);
 var IncidentStart = escape(document.getElementById('IncidentStartDetails').innerHTML);
 var IncidentEnd = escape(document.getElementById('IncidentEndDetails').innerHTML);
 var TimeZone = escape(document.getElementById('TimeZoneDetails').innerHTML);
 var RootCause = escape(document.getElementById('RootDetails').innerHTML);
 var LessonsLearned = escape(document.getElementById('LessonsLearnedDetails').innerHTML);
 QueryLink = "?ID=" + IncidentID + '&Team=' + Team;
 QueryLink = escape(QueryLink);
 IncidentLink = 'https://ishareteam2.na.xom.com/sites/FMRE012/SitePages/IRP_Incident.aspx' + QueryLink;
 
if (EmailType == "InternalBriefing") {
 var emailTo = "";
 var emailCC = "";
 var emailSubject = "Incident Internal Briefing";
 var emailBody = '%0D%0A' +
 'RBU: ' + RBUDetails + '%0D%0A' +
 'Incident Name:        ' + Incident + '%0D%0A%0D%0A' +
 'Link to Incident Response Page: ' + IncidentLink + '%0D%0A%0D%0A' +
 'Status Update:         [New Status Information/Estimated Timing of Next Update] %0D%0A%0D%0A' +
 'Incident Description: ' + IncidentInfo + '%0D%0A%0D%0A' +
 'Business Impacts:      ' + BusinessImpact + '%0D%0A%0D%0A' + 
 'Incident Start:          ' +  IncidentStart + '  ' + TimeZoneDetails + '%0D%0A%0D%0A' + 
 'Root Cause:              ' + RootCause + '%0D%0A%0D%0A';
 }

if (EmailType == "ExternalBriefing") {
 var emailTo = "";
 var emailCC = "";
 var emailSubject = "Incident External Briefing";
 var emailBody = 'Be advised that an Incident has been raised and an Incident Response Team has been established to restore normal operations as quickly as possible, and minimize any adverse impact of this event. ' + '%0D%0A%0D%0A' +
 'In that sense, we are mobilizing company and third party resources to address the requirements of this incident. ' + '%0D%0A%0D%0A' +
 'We will provide further details of the Incident as they become available. We will also conduct a thorough investigation of the cause of this event. ' + '%0D%0A%0D%0A' +
 'Incident Details are as follows: ' + '%0D%0A%0D%0A' +
 'RBU: ' + RBUDetails + '%0D%0A' +
 'Incident Name:        ' + Incident + '%0D%0A%0D%0A' +
 'Status Update:         [New Status Information/Estimated Timing of Next Update] %0D%0A%0D%0A' +
 'Incident Description: ' + IncidentInfo + '%0D%0A%0D%0A' +
 'Business Impacts:      ' + BusinessImpact + '%0D%0A%0D%0A' + 
 'Incident Start:          ' +  IncidentStart + '  ' + TimeZoneDetails + '%0D%0A%0D%0A' + 
 'Root Cause:              ' + RootCause + '%0D%0A%0D%0A';
 } 

if (EmailType == "IncidentCloseout") {
 var emailTo = "";
 var emailCC = "";
 var emailSubject = "Incident Internal Briefing";
 var emailBody = '%0D%0A' +
 'The Incident has been resolved/closed as per the details below: ' + '%0D%0A%0D%0A' +
 'RBU: ' + RBUDetails + '%0D%0A' +
 'Incident Name:        ' + Incident + '%0D%0A%0D%0A' +
 'Link to Incident Response Page: ' + IncidentLink + '%0D%0A%0D%0A' +
 'Status Update:         [New Status Information/Estimated Timing of Next Update] %0D%0A%0D%0A' +
 'Incident Description: ' + IncidentInfo + '%0D%0A%0D%0A' +
 'Business Impacts:      ' + BusinessImpact + '%0D%0A%0D%0A' + 
 'Incident Start:          ' +  IncidentStart + '  ' + TimeZoneDetails + '%0D%0A%0D%0A' +
 'Incident End:          ' +  IncidentEnd + '  ' + TimeZoneDetails + '%0D%0A%0D%0A' + 
 'Root Cause:              ' + RootCause + '%0D%0A%0D%0A';
 'Lessons Learned:         ' + LessonsLearned + '%0D%0A%0D%0A' +
 'We are constantly reviewing our performance and services to make improvements.' ;
}
 
 var mailURL = "mailto:"+ emailTo + "?subject=" + emailSubject + "&body=" + emailBody ;              
 window.location.href = mailURL; 

 }
</script><script> // On Dropdown Change
function VendorsChange() {
VendorsChangeCheck = true;
			}
			
function CountriesChange() {
CountriesChangeCheck = true
			}
</script>
<script> // File Upload
function CreateFile() {
if ( document.getElementById('KeyFile').files.length === 0) {
        alert('No file was selected');
        return;
    }
    else{
          // Ensure the HTML5 FileReader API is supported
      if (window.FileReader)
      {
          input = document.getElementById('KeyFile');
    
          if (input)
          {
              file = input.files[0];      
       fr = new FileReader();
              fr.onload = receivedBinary;
              fr.readAsDataURL(file);
          }
      }
      else
      {
          alert("The HTML5 FileSystem APIs are not fully supported in this browser.");
      }
 }

}

// Callback function for onload event of FileReader
function receivedBinary() {
var Related = $("#Related").val();
var Keywords = $("#Keywords").val();

    // Get the ClientContext for the app web
    var clientContext = new SP.ClientContext.get_current();
    
    //get lib from its name
    var parentList = clientContext.get_web().get_lists().getByTitle("IRP Key Documents");

    //File Object
    var fileCreateInfo = new SP.FileCreationInformation();

    //set file properties
    fileCreateInfo.set_url(file.name);
    fileCreateInfo.set_overwrite(true);
    fileCreateInfo.set_content(new SP.Base64EncodedByteArray());

    // Read the binary contents of the base 64 data URL into a Uint8Array
    // Append the contents of this array to the SP.FileCreationInformation
    var arr = convertDataURIToBinary(this.result);
    
    for (var i = 0; i < arr.length; ++i)
    {
        fileCreateInfo.get_content().append(arr[i]);
    }

    // Upload the file to the root folder of the document library
    newFile = parentList.get_rootFolder().get_files().add(fileCreateInfo);
  
    //file MetaData
    var oListItem = newFile.get_listItemAllFields();
    
    //set item properties
    oListItem.set_item('IncidentID',IncidentID);
	oListItem.set_item('Response_x0020_Team',Team);
	oListItem.set_item('Related_x0020_To',Related);
	oListItem.set_item('Keywords',Keywords);
	
    
    
    //update item
    oListItem.update();

    //load and execute query
    clientContext.load( newFile );
    clientContext.executeQueryAsync( onUploadSuccess, onUploadFailed );
}

function onUploadSuccess(){
 alert("The file saved successfully. The page will quickly refresh to show the latest information.");
	var url = "https://ishareteam2.na.xom.com/sites/FMRE012/SitePages/IRP_Incident.aspx?ID=" + IncidentID + "&Team=" + Team
	window.location.href = url;
}

function onUploadFailed(sender, args) {

    alert('Request failed. ' + args.get_message() + '\n' + args.get_stackTrace());
}

// Utility function to remove base64 URL prefix and store base64-encoded string in a Uint8Array
// Courtesy: https://gist.github.com/borismus/1032746
function convertDataURIToBinary(dataURI) {
    var BASE64_MARKER = ';base64,';
    var base64Index = dataURI.indexOf(BASE64_MARKER) + BASE64_MARKER.length;
    var base64 = dataURI.substring(base64Index);
    var raw = window.atob(base64);
    var rawLength = raw.length;
    var array = new Uint8Array(new ArrayBuffer(rawLength));

    for (i = 0; i < rawLength; i++)
    {
        array[i] = raw.charCodeAt(i);
    }
    return array;
}

$(document).on("keyup", ".people-picker-input", function () {

    let el = $(this);
    let query = el.val().trim();

    if (query.length < 2) {
        el.siblings(".people-picker-results").hide();
        return;
    }

    searchUsers(query).then(function (data) {

        let results = data.d.results;
        let box = el.siblings(".people-picker-results");
        box.empty();

        results.forEach(function (user) {
            box.append(`
                <div data-id="${user.Id}" data-name="${user.Title}">
                    ${user.Title} (${user.Email})
                </div>
            `);
        });

        box.show();
    });
});

$(document).on("click", ".people-picker-results div", function () {

    let userId   = $(this).data("id");
    let userName = $(this).data("name");

    let container = $(this).closest(".people-picker-container");
    let input = container.find(".people-picker-input");

    let itemId = input.data("id");

    input.val(userName);
    container.find(".people-picker-results").hide();

    // Save person lookup ID
    updateActionField(itemId, "Assigned_x0020_ToId", userId);
});
</script>
<script>
function exportTableToExcel(table, filename, type, fun, dl) {
    var elt = document.getElementById(table);
    var wb = XLSX.utils.table_to_book(elt, { sheet: "sheet1", raw:true });
    return dl ?
        XLSX.write(wb, { bookType: type, bookSST: true, type: 'base64' }) :
        XLSX.writeFile(wb, fun || ( filename + '.' + (type || 'xlsx')));
}
</script>


<!-- People Picker -->
	<script src="/sites/FMRE012/SiteAssets/JS/People Picker/angular.min.js" type="text/javascript"></script>
	<script src="/sites/FMRE012/SiteAssets/JS/People Picker/angular-route.min.js" type="text/javascript"></script>
	<script src="/sites/FMRE012/SiteAssets/JS/People Picker/pikaday-angular.js" type="text/javascript"></script>
	<script src="/sites/FMRE012/SiteAssets/JS/People Picker/ui-bootstrap-typeahead-tpls-2.4.0.js" type="text/javascript"></script>

	<script src="/sites/FMRE012/SiteAssets/JS/People Picker/app.js" type="text/javascript"></script>
	<script src="/sites/FMRE012/SiteAssets/JS/People Picker/app.core.js" type="text/javascript"></script>
	<script src="/sites/FMRE012/SiteAssets/JS/People Picker/app.services.js" type="text/javascript"></script>
	<script src="/sites/FMRE012/SiteAssets/JS/People Picker/angular-unity.js" type="text/javascript"></script>
	<script src="/sites/FMRE012/SiteAssets/JS/People Picker/sp13.fct.js" type="text/javascript"></script>

	<script src="/sites/FMRE012/SiteAssets/JS/People Picker/default.ctrl.js" type="text/javascript"></script>
	<!-- <script src="/sites/FMRE012/SiteAssets/JS/People Picker/multiPP.ctrl.js" type="text/javascript"></script> -->
	
<!-- Unity JS Keep at bottom of body-->    
<script src="/sites/FMRE012/SiteAssets/unity-1.3.0/js/em-unity-1.3.0.min.js" type="text/javascript"></script>

</form>
</body>
<!-- end body -->

</html>

