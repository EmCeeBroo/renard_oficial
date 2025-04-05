// Hide preloader after page loads
window.addEventListener('load', function() {
    document.getElementById('preloadId').style.display = 'none';
  });
  
  // Password strength checker
  function checkPasswordStrength() {
    const password = document.getElementById('password').value;
    const strengthBar = document.getElementById('passwordStrengthBar');
    
    // Simple password strength calculation
    let strength = 0;
    
    if (password.length >= 8) strength += 25;
    if (password.match(/[A-Z]/)) strength += 25;
    if (password.match(/[0-9]/)) strength += 25;
    if (password.match(/[^A-Za-z0-9]/)) strength += 25;
    
    strengthBar.style.width = strength + '%';
    
    // Change color based on strength
    if (strength < 50) {
      strengthBar.style.backgroundColor = '#dc3545'; // red - weak
    } else if (strength < 75) {
      strengthBar.style.backgroundColor = '#ffc107'; // yellow - medium
    } else {
      strengthBar.style.backgroundColor = '#198754'; // green - strong
    }
  }
  
  // Handle profile photo upload preview
  document.getElementById('foto_perfil').addEventListener('change', function(e) {
    const file = e.target.files[0];
    if (file) {
      const reader = new FileReader();
      reader.onload = function(event) {
        document.getElementById('profilePhotoPreview').src = event.target.result;
      };
      reader.readAsDataURL(file);
    }
  });
  
  // Handle form submission
  document.getElementById('register-form').addEventListener('submit', async function(e) {
    e.preventDefault();
    
    // Validate password match
    const password = document.getElementById('password').value;
    const confirmPassword = document.getElementById('confirmPassword').value;
    
    if (password !== confirmPassword) {
      alert('Las contraseñas no coinciden. Por favor, inténtalo de nuevo.');
      return;
    }
    
    // Validate password strength
    const strengthBar = document.getElementById('passwordStrengthBar');
    const strength = parseInt(strengthBar.style.width) || 0;
    
    if (strength < 75) {
      alert('La contraseña es demasiado débil. Por favor, usa una contraseña más segura.');
      return;
    }
    
    // Validate terms checkbox
    if (!document.getElementById('termsCheck').checked) {
      alert('Debes aceptar los términos y condiciones para registrarte.');
      return;
    }
    
    // Prepare form data
    const formData = new FormData(this);
    
    try {
      // Show loading state
      document.getElementById('preloadId').style.display = 'flex';
      document.getElementById('preload-title').textContent = 'Registrando...';
      
      // First create user (you'll need to adjust this to match your actual API)
      const userResponse = await fetch(`${API_URL}/register`, {
        method: 'POST',
        body: JSON.stringify({
          email: formData.get('correo_perfil'),
          password: password
        }),
        headers: {
          'Content-Type': 'application/json'
        }
      });
      
      const userData = await userResponse.json();
      
      if (userData.error) {
        throw new Error(userData.error);
      }
      
      // Add user ID to form data for profile creation
      formData.append('usuario_fk', userData.id);
      
      // Then create profile with the user ID
      const profileResponse = await fetch(`${API_URL}/perfil`, {
        method: 'POST',
        body: formData
      });
      
      const profileData = await profileResponse.json();
      
      if (profileData.error) {
        throw new Error(profileData.error);
      }
      
      // Registration successful
      alert('Registro exitoso! Serás redirigido al login.');
      window.location.href = 'login.html';
      
    } catch (error) {
      console.error('Error en el registro:', error);
      alert('Error en el registro: ' + error.message);
    } finally {
      document.getElementById('preloadId').style.display = 'none';
    }
  });
  
  // Add event listener for password strength check
  document.getElementById('password').addEventListener('keyup', checkPasswordStrength);