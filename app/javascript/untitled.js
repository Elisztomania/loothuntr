  // Comment lier les documents ?
const submit_commentaire = document.querySelector('.btn-dash .commentaire');
const submit_publication = document.querySelector('.btn-dash .publication');
const baseUrl = "http://loothuntr.co/";
  // No idea de comment récupérer l'id de guild, dans l'équivalent des params?
const url = '${baseUrl}/guilds/guild_id';
const content = document.querySelector('.content');
const author = document.querySelector('.username');
const comments = document.querySelector('.comments')

const cleanMessagesList = () => {
  comments.innerHTML = "";
};

const createMessage = () => {
  fetch(url, {
    method: 'POST',
  // author, est-ce que ça doit être le nom que j'utilise en ruby ? Donc user_id/username ?
    body: JSON.stringify({ author: author.value, content: content.value })
  });
};

const rightTime = (createAt) => {
  const timing = Math.round((Date.now() - new Date(createAt) / 60000));
  return `<span class="date">${timing} minutes ago</span>`;
};


const listMessage = () => {
  fetch(url)
    .then(response => response.json())
    .then((data) => {
      cleanMessagesList();
      // ça affiche que 5 messages du coup ? Nous on les veut tous
      for (let i = 0; i <= 4; i += 1) {
        const index = data.messages.length - 1 - i;
        const create = data.messages[index].created_at;
        const time = rightTime(create);
        const message = `<p>${data.messages[index].content} (posted ${time}) by ${data.messages[index].author}</p>`;
      }
    });
};

submit_commentaire.addEventListener(("click"), (event) => {
  listMessage();
  createMessage();
});

