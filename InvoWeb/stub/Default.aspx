<%@ Page Title="" Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PageTitle" Runat="Server">
Cyber Stock Analyzer-[Home Page]
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageHead" Runat="Server">
    <link href="Css/bjqs.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery-1.7.1.min.js" type="text/javascript"></script>
    <script src="js/bjqs-1.3.min.js" type="text/javascript"></script>
     <script type="text/javascript">
         jQuery(document).ready(function ($) {

             $('#banner-fade').bjqs({
                 height: 420,
                 width: 850,
                 responsive: true,
                 animtype : 'slide', // accepts 'fade' or 'slide'
                 animduration : 5000, // how fast the animation are
                 animspeed: 2000, // the delay between each slide
                showcontrols: false, // show next and prev controls
                centercontrols: false,
                keyboardnav : false, // enable keyboard navigation
                hoverpause : true, // pause the slider on hover
                automatic : true // automatic
             });

         });
      </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
  <h1>
    Welcome TO Cyber Stock Analyzer..!
</h1>
 <p><a href="#">Cyber Stock Analyzer</a> System is Sales Order Processing to automate entry and routing of incoming customer orders & Accounts Receivable Invoicing to automate processing and delivery of billing documents based on customer preferences.</p>      
<br />
 <center>
 <div id="banner-fade">
  <ul class="bjqs">
          <li><img src="Img/title.jpg" alt="InvoWebStub"/></li>
          <li><img src="Img/mens.png" alt="InvoWebStub"/></li>
 </ul>
 </div>
 </center>
 <br />
 <p>The invoice contains the issuer’s and recipient’s details, a description of the products and services provided, unit prices, total prices, discounts and taxes. 
  the electronic invoicing process comprises two basic and differentiated processes in all invoicing management systems – the issuance and receipt of invoices.
  </p><br />
 <p> At the issuance stage, the issuer, with the recipient’s approval, transfers the electronic invoice to the recipient telemetrically (often including use of the electronic signature), and keeps a copy or the original (database). 
   </p><br />
<p>If retained in the database, it is not necessary to keep copies of the electronically-signed documents. The recipient receives the invoice in digital format and keeps it in this format for future reference or printing, if necessary. </p><br /><p>Given that the invoice is an electronically signed document, the recipient should keep the information that verifies the validity of the electronic signature or that will enable this validity to be proved after a certain length of time.
 </p>
</asp:Content>

