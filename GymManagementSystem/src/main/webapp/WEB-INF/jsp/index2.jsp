<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Gym Website</title>
  <style>
    /* General Styling */
    body {
      font-family: Arial, sans-serif;
      margin: 0;
      padding: 0;
      background-color: #f4f4f4; /* Light background color for better contrast */
    }

    /* Navigation Bar */
    .navbar {
      position: fixed;
      top: 0;
      width: 100%;
      background-color: #333;
      padding: 10px 0;
      display: flex;
      justify-content: center;
      z-index: 1000;
    }

    .navbar a {
      color: white;
      padding: 14px 20px;
      text-decoration: none;
      text-align: center;
    }

    .navbar a:hover {
      background-color: #ddd;
      color: black;
    }

    /* Home Section */
    .home-section {
      position: relative;
      width: 100%;
      height: 100vh;
      background: linear-gradient(to bottom, rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 1)), url('/images/index.jpg') no-repeat center center/cover;
      display: flex;
      flex-direction: column;
      justify-content: center;
      align-items: center;
      color: white;
      text-align: center;
      z-index: 5;
    }

    .home-section h1, .home-section p {
      margin: 0;
    }

    .home-section .cta-buttons {
      margin-top: 20px;
    }

    .home-section .cta-buttons button {
      padding: 10px 20px;
      margin: 0 10px;
      border: none;
      background: #ff7f50;
      color: white;
      cursor: pointer;
      transition: background 0.3s;
    }

    .home-section .cta-buttons button:hover {
      background: #ff6347;
    }

    /* Content Sections */
    .content-section {
      display: flex;
      align-items: center;
      justify-content: center;
      padding: 60px 20px;
      margin-top: 50px;
    }

    .content-section .content {
      width: 80%;
      padding: 20px;
    }

    .content-section .image-container {
      width: 40%;
      display: flex;
      justify-content: center;
    }

    .content-section .image-container img {
      max-width: 100%;
      border-radius: 10px;
    }

    /* Section Styles */
    .about-section, .services-section, .trainers-section, .membership-section, .facilities-section, .offers-section, .contact-section {
     
      text-align: center;
    }

    #services ul {
      list-style-type: none;
      padding: 0;
    }

    #services ul li {
      font-size: 18px;
      font-weight: bold;
      margin-bottom: 10px;
    }

    #services ul li i {
      margin-right: 10px;
    }

    h2 {
      margin-bottom: 20px;
    }

    ul {
      list-style: none;
    }

    button {
      padding: 10px 20px;
      margin-top: 20px;
      border: none;
      background: #ff7f50;
      color: white;
      cursor: pointer;
      transition: background 0.3s;
    }

    button a {
      padding: 10px 20px;
      font-size: 20px;
      margin-top: 20px;
      text-decoration: none;
      border: none;
      background: #ff7f50;
      color: white;
      cursor: pointer;
      transition: background 0.3s;
    }

    button a:hover {
      background: #ff6347;
    }

    button:hover {
      background: #ff6347;
    }

    /* Footer Styles */
    .footer-top {
      background-color: #333;
      color: white;
      padding: 40px 20px;
      display: flex;
      flex-wrap: wrap;
      justify-content: space-between;
      gap: 20px;
    }

    .footer-top .column {
      flex: 1;
      min-width: 200px;
      margin: 0 20px;
    }

    .footer-top .column h3 {
      margin-top: 0;
      font-size: 24px;
    }

    .footer-top .column p {
      font-size: 16px;
      line-height: 1.5;
    }

    .footer-top .column ul {
      list-style: none;
      padding: 0;
    }

    .footer-top .column ul li {
      margin-bottom: 10px;
    }

    .footer-top .column ul li a {
      color: white;
      text-decoration: none;
    }

    .footer-top .column ul li a:hover {
      text-decoration: underline;
    }

    .footer-bottom {
      background-color: #222;
      color: white;
      padding: 20px;
      text-align: center;
    }

    .footer-bottom .social-icons {
      margin-top: 10px;
    }

    .footer-bottom .social-icons a {
      color: white;
      margin: 0 10px;
      text-decoration: none;
      font-size: 20px;
    }

    .footer-bottom .social-icons a:hover {
      color: #ff7f50;
    }

    /* Feedback and Reviews Section */
    .feedback-reviews-section {
      display: flex;
      justify-content: center;
      padding: 60px 20px;
      gap: 20px;
    }

    .feedback-form-container, .reviews-container {
      width: 100%;
      max-width: 600px;
      padding: 20px;
      border-radius: 8px;
      box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    }

    .feedback-form-container {
      background-color: #ffffff;
    }

    .feedback-form-container h2 {
      font-size: 24px;
      margin-bottom: 20px;
    }

    .feedback-form label {
      font-size: 16px;
      margin-bottom: 10px;
      display: block;
    }

    .feedback-form textarea {
      width: 95%;
      padding: 10px;
          height: 200px;
      margin-bottom: 20px;
      border: 1px solid #ccc;
      border-radius: 5px;
    }

    .feedback-form button {
      padding: 10px 20px;
      border: none;
      background: #ff7f50;
      color: white;
      cursor: pointer;
      transition: background 0.3s;
    }

    .feedback-form button:hover {
      background: #ff6347;
    }

    .reviews-container {
      background-color: #ffffff;
      padding: 20px;
      border-radius: 8px;
      box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
     
  
    }
    .scroller{
     height: 300px;
  width: 550px;
    overflow: scroll}

    .reviews-container h2 {
      font-size: 24px;
      margin-bottom: 20px;
    }

    .reviews-container table {
      width: 100%;
      border-collapse: collapse;
    }

    .reviews-container th, .reviews-container td {
      padding: 10px;
      border: 1px solid #ddd;
      text-align: left;
    }

    .reviews-container th {
      background-color: #f4f4f4;
    }

    .review {
      margin-bottom: 20px;
    }

    .review h3 {
      font-size: 20px;
      margin-bottom: 10px;
    }

    .review p {
      font-size: 16px;
      color: #666;
    }

    /* Responsive Design */
    @media (max-width: 768px) {
      .content-section {
        flex-direction: column;
        align-items: center;
      }

      .feedback-reviews-section {
        flex-direction: column;
      }
    }
    
    .image-about {
  background-image: url('/images/about.png');
  background-size: cover; /* Ensures the image covers the entire container */
  background-position: center; /* Centers the image within the container */
  background-repeat: no-repeat; /* Prevents the image from repeating */
  margin-right: 50px;
  height: 400px;
  width: 550px;
  border-radius: 10px; /* Optional: Adds rounded corners to the container */
}
.image-trainer {
  background-image: url('/images/trainer.jpg');
  background-size: cover; /* Ensures the image covers the entire container */
  background-position: center; /* Centers the image within the container */
  background-repeat: no-repeat; /* Prevents the image from repeating */
  margin-right: 50px;
  height: 500px;
  width: 1050px;
  border-radius: 10px; /* Optional: Adds rounded corners to the container */
}
.trainers-section {
  padding: 50px 0;
  background-color: #f9f9f9;
  text-align: center;
}
.trainer {
  background-color: #fff;
  border-radius: 10px;
  box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
  padding: 20px;
  margin-bottom: 20px;
  text-align: left;
}
    .trainer h3 {
  font-size: 24px;
  color: #333;
}

.trainer p {
  font-size: 18px;
  color: #666;
}
    .bg {
  background-color: white;
}
    
    
  </style>
  <script>
    function removeMessage() {
      document.getElementById('messageBox').style.display = 'none';
    }
  </script>
</head>
<body>
  <div class="user-home-page">
    <!-- Navigation Bar -->
    <div class="navbar">
      <a href="#home">HOME</a>
      <a href="/slots">SLOT BOOKING</a>
      <a href="customerBookingDetails">BOOKING DETAILS</a>
      <a href="#about">ABOUT  US</a>
      <a href="#trainers">TRAINERS</a>
      <a href="#feedback-reviews">FEEDBACK</a>
      <a href="/logout">LOGOUT</a>
    </div>
   
    <div class="bg">
      <!-- Home Section -->
      <div id="home" class="home-section">
        <c:if test="${not empty sessionScope.user}">
          <p>Welcome, ${sessionScope.user.username}!</p>
        </c:if>
        <h1>Welcome to Our Gym</h1>
        <p>Your fitness journey starts here.</p>
        <div class="cta-buttons">
          <button onclick="location.href='#about'">Learn More</button>
          <button onclick="location.href='/slots'">Book a Slot</button>
        </div>
      </div>
      <!-- About Section -->
      <section id="about" class="about-section content-section fade-in">
        <div class="content">
          <h2>About Us</h2>
          <p>
            Welcome to our Fitness Center, where we are committed to helping you achieve your fitness goals with our state-of-the-art facilities and expert trainers. Our mission is to provide a comprehensive fitness experience that caters to individuals of all fitness levels. Whether you are looking to build strength, improve your endurance, or maintain a healthy lifestyle, our gym offers a variety of services and programs to meet your needs.
            <br><br>
            At our gym, we pride ourselves on our supportive and motivating community. Our certified trainers are here to guide you every step of the way, offering personalized training plans and nutritional advice to ensure you get the most out of your workouts. Join us today and take the first step towards a healthier, fitter you!
          </p>
        </div>
        <div class="image-container image-about"></div>
      </section>
       <!-- Trainer Section -->
       <section id="trainers" class="trainers-section content-section slide-in-right">
        <div class="content">
          <h2>Meet Our Trainers</h2>
          <div class="trainer">
            <h3>Jane Doe</h3>
            <p>Strength Training Expert</p>
            <p>Contact: 123-456-7890</p>
            <p>Experience: Over 10 years of training experience in strength and conditioning.</p>
          </div>
          <div class="trainer">
            <h3>John Smith</h3>
            <p>Yoga Instructor</p>
            <p>Contact: 987-654-3210</p>
            <p>Experience: Certified yoga instructor with a focus on hatha and vinyasa yoga. Teaching for 7 years.</p>
          </div>
        </div>
        <div class="image-trainer"></div>
      </section>
    
      <!-- Feedback and Reviews Section -->
      <div id="feedback-reviews" class="feedback-reviews-section">
        <!-- Feedback Form -->
        <div class="feedback-form-container">
          <h2>Submit Your Feedback</h2>
          <form class="feedback-form" action="/feedback" modelAttribute="feedback" method="post" enctype="multipart/form-data">
           
            <label for="message">Feedback:</label>
            <textarea id="message" name="content" rows="4" required></textarea>
            <button type="submit">Submit</button>
        </form>  
        </div>
        
        <!-- Reviews Display -->
        
        <div class="reviews-container">
          <h2>Customer Reviews</h2>
          <div class="scroller">
          <c:choose>
            <c:when test="${not empty feedbacks}">
              <table>
                <thead>
                  <tr>
                    <th>Name</th>
                    <th>Feedback</th>
                  </tr>
                </thead>
                <tbody>
                  <c:forEach var="feedback" items="${feedbacks}">
                    <tr>
                      <td>${feedback.name}</td>
                      <td>${feedback.content}</td>
                    </tr>
                  </c:forEach>
                </tbody>
              </table>
            </c:when>
            <c:otherwise>
              <p>No reviews available yet.</p>
            </c:otherwise>
          </c:choose>
          </div>
        </div>
      </div>
      
      <!-- Footer -->
      <div class="footer-top">
        <div class="column">
          <h3>About Us</h3>
    <p>Your premier fitness facility with state-of-the-art equipment, experienced trainers, and a vibrant community.</p>
        </div>
        <div class="column">
          <h3>Quick Links</h3>
          <ul>
            <li><a href="#home">Home</a></li>
            <li><a href="#about">About Us</a></li>
            <li><a href="#trainers">Trainers</a></li>
            <li><a href="#feedback-reviews">Submit Feedback</a></li>
          </ul>
        </div>
        <div class="column">
          <h3>Contact Us</h3>
          <p>Email: info@gymwebsite.com</p>
          <p>Phone: (123) 456-7890</p>
          <div class="social-icons">
            <a href="#"><i class="fa fa-facebook"></i></a>
            <a href="#"><i class="fa fa-twitter"></i></a>
            <a href="#"><i class="fa fa-instagram"></i></a>
          </div>
        </div>
      </div>
      
      <div class="footer-bottom">
        <p>&copy; 2024 Gym Website. All rights reserved.</p>
      </div>
    </div>
  </div>
</body>
</html>
