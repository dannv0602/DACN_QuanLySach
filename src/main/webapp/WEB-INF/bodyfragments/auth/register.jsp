<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<div class='center'>
    <div class='right-panel-active container' id="container">
        <div class='form-container sign-up-container'>
            <form:form action="/auth/signup" modelAttribute="user">
                <h1>Create Account</h1>
                <div class='social-container'>
                    <a href="#" class='social'><i class="fab fa-facebook-f"></i></a> <a
                        href="#" class='social'><i class="fab fa-google-plus-g"></i></a> <a
                        href="#" class='social'><i class="fab fa-linkedin-in"></i></a>
                </div>
                <form:input  path="username"  placeholder="Username" />
                <form:errors path="username" cssClass="error"/>
                <form:input  path="email" type="email" placeholder="Email" />
                <form:errors path="email" cssClass="error"/>
                <form:input  path="password" type="password" placeholder="Password" />
                <form:errors path="password" cssClass="error"/>
                <form:input  path="fullname" placeholder="Full name" />
                <form:errors path="fullname" cssClass="error"/>
                <form:input  path="birthday" type="date" placeholder="Birthday" />
                <form:errors path="birthday" cssClass="error"/>
                <form:input  path="address" placeholder="Address" />
                <form:errors path="address" cssClass="error"/>
                <form:input  path="phone" placeholder="Phone" />
                <form:errors path="phone" cssClass="error"/>
                <button>Sign Up</button>
            </form:form>
        </div>
        <div class='overlay-container'>
            <div class='overlay'>
                <div class='overlay-panel overlay-left'>
                    <h1>Welcome Back!</h1>
                    <p>To keep connected with us please login with your personal
                        info</p>
                    <button class='ghost' onclick="location.href='/auth/login';" id="signIn">Sign In</button>
                </div>
            </div>
        </div>
    </div>
</div>
