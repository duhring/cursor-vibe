// Build card grid from segmentsData
window.addEventListener('DOMContentLoaded', ()=>{
  const container=document.getElementById('segments-container');
  segmentsData.forEach(seg=>{
    const card=document.createElement('article');
    card.className='card';
    const slug = seg.title.toLowerCase().replace(/[^a-z0-9]+/g,'_');
    card.innerHTML = `
      <img src="assets/images/segment${seg.id}_${slug}.png"
           alt="Screenshot at ${Math.floor(seg.start/60)}:${String(seg.start%60).padStart(2,'0')}">
      <div class="card-content">
        <h2>${seg.title}</h2>
        <p class="quote">“${seg.quote}”</p>
        <p class="significance">${seg.significance}</p>
      </div>
      <footer class="card-footer">
        <span class="badge ${seg.category.replace(/\s+/g,'\\ ')}">${seg.category}</span>
        <a href="https://youtu.be/TQhv6Wol6Ns?t=${seg.start}" target="_blank">
          ▶ ${Math.floor(seg.start/60)}:${String(seg.start%60).padStart(2,'0')}
        </a>
      </footer>`;
    container.appendChild(card);
  });
});