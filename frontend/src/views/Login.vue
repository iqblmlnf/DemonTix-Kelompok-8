<template>
  <div :class="['container', { 'sign-up-mode': isSignUp }]">
    <div class="forms-container">
      <div class="signin-signup">
        <!-- SIGN IN FORM -->
        <form class="sign-in-form" @submit.prevent="handleLogin">
          <h2 class="title">Sign In</h2>
          <div class="input-field">
            <i class="bi bi-person-fill"></i>
            <input v-model="loginUsername" type="text" placeholder="Username atau Email" class="form-control" />
          </div>
          <div class="input-field">
            <i class="bi bi-lock-fill"></i>
            <input v-model="loginPassword" type="password" placeholder="Password" class="form-control" />
          </div>
          <input type="submit" value="Login" class="btn solid" />
        </form>

        <!-- SIGN UP FORM -->
        <form class="sign-up-form" @submit.prevent="handleSignUp">
          <h2 class="title">Sign Up</h2>
          <div class="input-field">
            <i class="bi bi-person-fill"></i>
            <input type="text" placeholder="Username" v-model="signupUsername" />
          </div>
          <div class="input-field">
            <i class="bi bi-envelope-fill"></i>
            <input type="email" placeholder="Email" v-model="signupEmail" />
          </div>
          <div class="input-field">
            <i class="bi bi-lock-fill"></i>
            <input type="password" placeholder="Password" v-model="signupPassword" />
          </div>
          <input type="submit" value="Sign Up" class="btn solid" />
        </form>
      </div>
    </div>

    <!-- PANELS -->
    <div class="panels-container">
      <div class="panel left-panel">
        <div class="content">
          <h3>Belum Punya Akun?</h3>
          <button class="btn transparent" @click="isSignUp = true">Sign Up</button>
        </div>
        <img src="../assets/images/logo.png" class="image" alt="Logo" />
      </div>

      <div class="panel right-panel">
        <div class="content">
          <h3>Sudah Punya Akun?</h3>
          <button class="btn transparent" @click="isSignUp = false">Sign In</button>
        </div>
        <img src="../assets/images/logo.png" class="image" alt="Logo" />
      </div>
    </div>
  </div>
</template>

<script>
import axios from "axios";
import Swal from "sweetalert2";
import { ref } from "vue";
import { useRouter } from "vue-router";

export default {
  setup() {
    const isSignUp = ref(false);
    const signupUsername = ref("");
    const signupEmail = ref("");
    const signupPassword = ref("");

    const loginUsername = ref("");
    const loginPassword = ref("");
    const router = useRouter();

    const handleSignUp = async () => {
      try {
        await axios.post("http://127.0.0.1:8000/api/register", {
          username: signupUsername.value,
          email: signupEmail.value,
          password: signupPassword.value,
        });

        Swal.fire({
          icon: "success",
          title: "Registrasi Berhasil",
          text: "Silakan login dengan akun Anda!",
        });

        isSignUp.value = false;
      } catch (error) {
        Swal.fire({
          icon: "error",
          title: "Registrasi Gagal",
          text: error.response?.data?.message || "Terjadi kesalahan saat registrasi.",
        });
      }
    };

    const handleLogin = async () => {
      try {
        const response = await axios.post("http://127.0.0.1:8000/api/login", {
          username: loginUsername.value,
          password: loginPassword.value,
        });

        localStorage.setItem("user", JSON.stringify({ name: response.data.username }));

        if (response.data.role === "admin") {
          Swal.fire({
            icon: "success",
            title: "Login Admin Berhasil",
            showConfirmButton: false,
            timer: 1500,
          });
          router.push("/admin");
        } else {
          Swal.fire({
            icon: "success",
            title: "Login User Berhasil",
            showConfirmButton: false,
            timer: 1500,
          });
          router.push("/");
        }
      } catch (error) {
        Swal.fire({
          icon: "error",
          title: "Login Gagal",
          text: error.response?.data?.message || "Terjadi kesalahan saat login.",
        });
      }
    };

    return {
      loginUsername,
      loginPassword,
      handleLogin,
      isSignUp,
      signupUsername,
      signupEmail,
      signupPassword,
      handleSignUp,
    };
  },
};
</script>

<style scoped>
/* Styles tetap sama seperti yang kamu kirim sebelumnya */
</style>


<style scoped>
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

body,
input {
  font-family: "Poppins", sans-serif;
}

.container {
  position: relative;
  width: 100%;
  background-color: #fff;
  min-height: 100vh;
  overflow: hidden;
}

.forms-container {
  position: absolute;
  width: 100%;
  height: 100%;
  top: 0;
  left: 0;
}

.signin-signup {
  position: absolute;
  top: 50%;
  transform: translate(-50%, -50%);
  left: 75%;
  width: 50%;
  transition: 1s 0.7s ease-in-out;
  display: grid;
  grid-template-columns: 1fr;
  z-index: 5;
}

form {
  display: flex;
  align-items: center;
  justify-content: center;
  flex-direction: column;
  padding: 0rem 5rem;
  transition: all 0.2s 0.7s;
  overflow: hidden;
  grid-column: 1 / 2;
  grid-row: 1 / 2;
}

form.sign-up-form {
  opacity: 0;
  z-index: 1;
}

form.sign-in-form {
  z-index: 2;
}

.title {
  font-size: 2.2rem;
  color: #a43434;
  margin-bottom: 10px;
}

.input-field {
  max-width: 380px;
  width: 100%;
  background-color: #f0f0f0;
  margin: 10px 0;
  height: 55px;
  border-radius: 55px;
  display: grid;
  grid-template-columns: 15% 85%;
  padding: 0 0.4rem;
  position: relative;
}

.input-field i {
  text-align: center;
  line-height: 55px;
  color: #a43434;
  transition: 0.5s;
  font-size: 1.1rem;
}

.input-field input {
  background: none;
  outline: none;
  border: none;
  line-height: 1;
  font-weight: 600;
  font-size: 1.1rem;
  color: #a43434;
}

.input-field input::placeholder {
  color: #a43434;
  font-weight: 500;
}

.social-text {
  padding: 0.7rem 0;
  font-size: 1rem;
}

.social-media {
  display: flex;
  justify-content: center;
}

.social-icon {
  height: 46px;
  width: 46px;
  display: flex;
  justify-content: center;
  align-items: center;
  margin: 0 0.45rem;
  color: #a43434;
  border-radius: 50%;
  border: 1px solid #333;
  text-decoration: none;
  font-size: 1.1rem;
  transition: 0.3s;
}

.social-icon:hover {
  color: #a43434;
  border-color: #a43434;
}

.btn {
  width: 150px;
  background-color: #a43434;
  border: none;
  outline: none;
  height: 49px;
  border-radius: 49px;
  color: #fff;
  text-transform: uppercase;
  font-weight: 600;
  margin: 10px 0;
  cursor: pointer;
  transition: 0.5s;
}

.btn:hover {
  background-color: #a43434;
}
.panels-container {
  position: absolute;
  height: 100%;
  width: 100%;
  top: 0;
  left: 0;
  display: grid;
  grid-template-columns: repeat(2, 1fr);
}

.container:before {
  content: "";
  position: fixed;
  height: 2000px;
  width: 2000px;
  top: -10%;
  right: 48%;
  transform: translateY(-50%);
  background-image: linear-gradient(-45deg, #a43434 0%, #3e1414 100%);
  transition: 1.8s ease-in-out;
  border-radius: 50%;
  z-index: 6;
}

.image {
  width: 220px;
  margin-top: 30px;
  transition: transform 1.1s ease-in-out;
  transition-delay: 0.4s;
}

.panel {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  text-align: center;
  z-index: 6;
}

.left-panel {
  pointer-events: all;
  padding: 3rem 40% 15rem 12%;
}

.right-panel {
  pointer-events: none;
  padding: 3rem 12% 15rem 40%;
}

.panel .content {
  color: #fff;
  transition: transform 0.9s ease-in-out;
  transition-delay: 0.6s;
}

.panel h3 {
  font-weight: 600;
  line-height: 1;
  font-size: 1.5rem;
}

.panel p {
  font-size: 0.95rem;
  padding: 0.7rem 0;
}

.btn.transparent {
  margin: 20px 0 0 0;
  background: none;
  border: 2px solid #fff;
  width: 130px;
  height: 41px;
  font-weight: 600;
  font-size: 0.8rem;
}

.right-panel .image,
.right-panel .content {
  transform: translateX(800px);
}

/* ANIMATION */

.container.sign-up-mode:before {
  transform: translate(100%, -50%);
  right: 52%;
}

.container.sign-up-mode .left-panel .image,
.container.sign-up-mode .left-panel .content {
  transform: translateX(-800px);
}

.container.sign-up-mode .signin-signup {
  left: 25%;
}

.container.sign-up-mode form.sign-up-form {
  opacity: 1;
  z-index: 2;
}

.container.sign-up-mode form.sign-in-form {
  opacity: 0;
  z-index: 1;
}

.container.sign-up-mode .right-panel .image,
.container.sign-up-mode .right-panel .content {
  transform: translateX(0%);
}

.container.sign-up-mode .left-panel {
  pointer-events: none;
}

.container.sign-up-mode .right-panel {
  pointer-events: all;
}

@media (max-width: 870px) {
  .container {
    min-height: 800px;
    height: 100vh;
  }
  .signin-signup {
    width: 100%;
    top: 95%;
    transform: translate(-50%, -100%);
    transition: 1s 0.8s ease-in-out;
  }

  .signin-signup,
  .container.sign-up-mode .signin-signup {
    left: 50%;
  }

  .panels-container {
    grid-template-columns: 1fr;
    grid-template-rows: 1fr 2fr 1fr;
  }

  .panel {
    flex-direction: row;
    justify-content: space-around;
    align-items: center;
    padding: 2.5rem 8%;
    grid-column: 1 / 2;
  }

  .right-panel {
    grid-row: 3 / 4;
  }

  .left-panel {
    grid-row: 1 / 2;
  }

  .image {
    width: 200px;
    transition: transform 0.9s ease-in-out;
    transition-delay: 0.6s;
  }

  .panel .content {
    padding-right: 15%;
    transition: transform 0.9s ease-in-out;
    transition-delay: 0.8s;
  }

  .panel h3 {
    font-size: 1.2rem;
  }

  .panel p {
    font-size: 0.7rem;
    padding: 0.5rem 0;
  }

  .btn.transparent {
    width: 110px;
    height: 35px;
    font-size: 0.7rem;
  }

  .container:before {
    width: 1500px;
    height: 1500px;
    transform: translateX(-50%);
    left: 30%;
    bottom: 68%;
    right: initial;
    top: initial;
    transition: 2s ease-in-out;
  }

  .container.sign-up-mode:before {
    transform: translate(-50%, 100%);
    bottom: 32%;
    right: initial;
  }

  .container.sign-up-mode .left-panel .image,
  .container.sign-up-mode .left-panel .content {
    transform: translateY(-300px);
  }

  .container.sign-up-mode .right-panel .image,
  .container.sign-up-mode .right-panel .content {
    transform: translateY(0px);
  }

  .right-panel .image,
  .right-panel .content {
    transform: translateY(300px);
  }

  .container.sign-up-mode .signin-signup {
    top: 5%;
    transform: translate(-50%, 0);
  }
}

@media (max-width: 570px) {
  form {
    padding: 0 1.5rem;
  }

  .image {
    display: none;
  }
  .panel .content {
    padding: 0.5rem 1rem;
  }
  .container {
    padding: 1.5rem;
  }

  .container:before {
    bottom: 72%;
    left: 50%;
  }

  .container.sign-up-mode:before {
    bottom: 28%;
    left: 50%;
  }
}
</style>
