<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<div class='center'>
    <div class='right-panel-active container' id="container">
        <div class='form-container sign-in-container'>
<form:form action="/auth/login" modelAttribute="userLogin">
                <h1>Sign in</h1>
                <div class='social-container'>
                    <a href="#" class='social'><i class="fab fa-facebook-f"></i></a> <a
                        href="#" class='social'><i class="fab fa-google-plus-g"></i></a> <a
                        href="#" class='social'><i class="fab fa-linkedin-in"></i></a>
                </div>
                <span>${error}</span>

                <form:input  path="username"  placeholder="Username" />
                <form:errors path="username" cssClass="error"/>
                <form:input  path="password" type="password" placeholder="Password" />
                <form:errors path="password" cssClass="error"/>

                <a href="#">Forgot your password?</a>
                <button>Sign In</button>
                </form:form>
        </div>
        <div class='overlay-container'>
            <div class='overlay'>
                <div class='overlay-panel overlay-left'>
                    <h1>Hello, Friend!</h1>
                    <p>Enter your personal details and start journey with us</p>
                    <button onclick="location.href='/auth/register';" class='ghost' id="signUp">Sign Up</button>
                </div>
            </div>
        </div>
    </div>
</div>
