document.addEventListener('DOMContentLoaded', function () {
  if (document.getElementById('user_avatar')) {
    const AvatarList = document.getElementById('avatar-list');

    const createImageHTML = (blob) => {
      const imageElement = document.createElement('div')
      const blobImage = document.createElement('img')
      blobImage.setAttribute('src', blob);
      imageElement.appendChild(blobImage);
      AvatarList.appendChild(imageElement)
    };

    document.getElementById('user_avatar').addEventListener('change', function (e) {
      const imageContent = document.querySelector('img')
      if (imageContent) {
        imageContent.remove();
      }
      const file = e.target.files[0];
      const blob = window.URL.createObjectURL(file);
      createImageHTML(blob);
    })

  }
});

// const imageElement = document.createElement('div');
// const blobImage = document.createElement('img');
// blobImage.setAttribute('src', blob);

// imageElement.appendChild(blobImage);
// AvatarList.appendChild(imageElement);