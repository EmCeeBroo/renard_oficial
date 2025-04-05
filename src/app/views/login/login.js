// Hide preloader after page loads
window.addEventListener('load', function() {
    document.getElementById('preloadId').style.display = 'none';
    
    // Check for remember me functionality
    const rememberMe = localStorage.getItem('rememberMe') === 'true';
    if (rememberMe) {
      document.getElementById('rememberMe').checked = true;
      const savedEmail = localStorage.getItem('email');
      if (savedEmail) {
        document.getElementById('email').value = savedEmail;
      }
    }
  });
  
  // Handle form submission
  document.getElementById('login-form').addEventListener('submit', async function(e) {
    e.preventDefault();
    
    const email = document.getElementById('email').value;
    const password = document.getElementById('password').value;
    const rememberMe = document.getElementById('rememberMe').checked;
    
    try {
      // Show loading state
      document.getElementById('preloadId').style.display = 'flex';
      document.getElementById('preload-title').textContent = 'Iniciando sesión...';
      
      // Call login API
      const response = await fetch(`${API_URL}/login`, {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json'
        },
        body: JSON.stringify({
          email: email,
          password: password
        })
      });
      
      const data = await response.json();
      
      if (data.error) {
        throw new Error(data.error);
      }
      
      // Handle remember me functionality
      if (rememberMe) {
        localStorage.setItem('rememberMe', 'true');
        localStorage.setItem('email', email);
      } else {
        localStorage.removeItem('rememberMe');
        localStorage.removeItem('email');
      }
      
      // Save token to sessionStorage
      if (data.token) {
        sessionStorage.setItem('authToken', data.token);
        
        // Redirect to dashboard or profile page
        window.location.href = 'perfil.html';
      } else {
        throw new Error('No se recibió token de autenticación');
      }
      
    } catch (error) {
      console.error('Error en el login:', error);
      alert('Error en el login: ' + error.message);
    } finally {
      document.getElementById('preloadId').style.display = 'none';
    }
  });
  
  // Optional: Add enter key submit
  document.getElementById('password').addEventListener('keypress', function(e) {
    if (e.key === 'Enter') {
      document.getElementById('login-form').dispatchEvent(new Event('submit'));
    }
  });