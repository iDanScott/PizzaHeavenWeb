<%@page import="pizzaheaven.models.PercentageOffer"%>
<%@page import="pizzaheaven.models.Customer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Pizza Heaven</title>
        <link href='http://fonts.googleapis.com/css?family=Lato:400,700' rel='stylesheet' type='text/css'>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel=stylesheet type="text/css" href="css/banner.css">
        <link rel=stylesheet type="text/css" href="css/mediaqueries.css">
        <link rel=stylesheet type="text/css" href="css/footer.css">
        <link rel=stylesheet type="text/css" href="css/menu.css">
        <script	src="https://code.jquery.com/jquery-1.12.4.min.js" type="text/javascript"></script>
	<script	src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js" type="text/javascript"></script>
        <script src="script/jsFunctions.js" type="text/javascript"></script>
        <script type="text/javascript" src="script/banner.js"></script>
    </head>
    <body>
        <div id="main">
            <header class="banner">
                <header class="subbanner">
                    <a href="index.jsp"><div class="topbanner logo">
                            <img id="mainLogo" src="img/PizzaHeavenLogo1.png"/>
                    </div></a>
                    <%
                        try{
                            session = request.getSession();
                            session.setAttribute("previousPage", request.getRequestURL());
                            Customer customer = (Customer) session.getAttribute("customer");
                            if (!customer.getCustomerID().equals("") || !customer.getCustomerID().equals(null)){
                                out.println("<div class='topbanner icon'><a href='LogOutServlet'>");
                                out.println("<h2>Logout</h2></a></div><div class='topbanner icon'><a href='account.jsp'>");
                                out.println("<h2>" + customer.getFirstName() + "'s Account</h2></a></div>");
                                out.println("<a href='basket.jsp'><div class='topbanner basket'><div class='basketIcon'><img src='img/basket.png' height='45px' width='45px'><h3 class='basketQuantity'>0</h3></div>");
                                out.println("<h3 class='basketTotal'>£0.00</h3></div></a>");
                            }
                        } catch(Exception ex){
                            out.println("<div class='topbanner icon'>");
                            out.println("<a href='login.jsp'><h2>Login</h2></a></div><div class='topbanner icon'>");
                            out.println("<a href='registration.jsp'><h2>Register</h2></a></div>");
                            out.println("<a href='basket.jsp'><div class='topbanner basket'><div class='basketIcon'><img src='img/basket.png' height='45px' width='45px'><h3 class='basketQuantity'>0</h3></div>");
                            out.println("<h3 class='basketTotal'>£0.00</h3></div></a>");
                        }
                    %>
                </header><br />
                <header id="menubanner" class="subbanner" style="padding-bottom: 0.7%">
                     <a href="PizzaMenuServlet"><div id="b">
                        <img src="img/pizzaIcon.png"/><h1>Pizza</h1>
                    </div></a>
                    <a href="SideMenuServlet"><div id="b">
                        <img src="img/sidesIcon.png"/><h1>Sides</h1>
                    </div></a>
                    <a href="DrinkMenuServlet"><div id="b">
                            <img src="img/drinksIcon.png"/><h1>Drinks</h1>
                    </div></a>
                    <a href="OfferServlet"><div id="b" style="background: #DA4246">
                        <h1>Offers</h1>
                    </div></a>
                </header>
            </header>
        </div>
        <div id="offers" class="menupage">
            <h4>
                
                <%
                    try{
                        Object objectList = (Object)session.getAttribute("percentageOfferList");
                        PercentageOffer[] percentageOfferList = (PercentageOffer[]) objectList;
                        out.println("<table><tr><th>Amount Spent</th><th>Discount</th></tr>");
                        for (PercentageOffer offer : percentageOfferList){
                            out.println("<tr><td>£" + offer.getMinimumValue() + "</td><td>" + offer.getDiscount() + "%</td></tr>");
                        }
                        out.println("</table>");
                    } catch (Exception e){
                        response.sendRedirect("OfferServlet");
                    } finally {
                        out.println("Sorry! There are no offers currently available. :(");
                    }
                %>
            </h4>
            <footer>
                <h10>
                    Legal details.
                    Social media links.
                </h10>
            </footer>
        </div>
    </body>
</html>
