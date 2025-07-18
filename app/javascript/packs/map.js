(g=>{var h,a,k,p="The Google Maps JavaScript API",c="google",l="importLibrary",q="__ib__",m=document,b=window;b=b[c]||(b[c]={});var d=b.maps||(b.maps={}),r=new Set,e=new URLSearchParams,u=()=>h||(h=new Promise(async(f,n)=>{await (a=m.createElement("script"));e.set("libraries",[...r]+"");for(k in g)e.set(k.replace(/[A-Z]/g,t=>"_"+t[0].toLowerCase()),g[k]);e.set("callback",c+".maps."+q);a.src=`https://maps.${c}apis.com/maps/api/js?`+e;d[q]=f;a.onerror=()=>h=n(Error(p+" could not load."));a.nonce=m.querySelector("script[nonce]")?.nonce||"";m.head.append(a)}));d[l]?console.warn(p+" only loads once. Ignoring:",g):d[l]=(f,...n)=>r.add(f)&&u().then(()=>d[l](f,...n))})({
  key: process.env.Maps_API_Key
});

let map;
let markers = [];

async function initMap() {
  const { Map } = await google.maps.importLibrary("maps");
  map = new Map(document.getElementById("map"), {
    center: { lat: 35.681236, lng: 139.767125 }, 
    zoom: 15,
    mapTypeControl: false
  });

  map.addListener("click", (event) => {
    const lat = event.latLng.lat();
    const lng = event.latLng.lng();
    addMarker(lat, lng);
    sendPinCoordinates(lat, lng);
  });

  function addMarker(lat, lng) {
    const marker = new google.maps.Marker({
      position: { lat: lat, lng: lng },
      map: map,
    });

    markers.push({ lat: lat, lng: lng });

    drawRoute();

    return markers;
  }

  function drawRoute() {
    const path = markers.map(marker => {
      return { lat: marker.lat, lng: marker.lng };
    });

    const route = new google.maps.Polyline({
      path: path,
      geodesic: true,
      strokeColor: '#FF0000',
      strokeOpacity: 1.0,
      strokeWeight: 2,
    });

    route.setMap(map);
  }
  
  function getCSRFToken() {
    const token = document.querySelector('meta[name="csrf-token"]').getAttribute('content');
    return token;
  }

  function sendPinCoordinates(lat, lng) {
    fetch('/users/' + currentUserId + '/roots', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'X-CSRF-Token': getCSRFToken()
      },
      body: JSON.stringify({ latitude: lat, longitude: lng, user_id: currentUserId })
    }).then(response => {
      if (response.ok) {
        return response.json();
      } else {
        throw new Error('ピンの情報を送信できませんでした。');
      }
    }).then(data => {
      console.log(data);
    }).catch(error => {
      console.error(error);
    });
  }

}

initMap()