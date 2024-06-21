const express = require('express');
const app = express();
const port = 3000;

app.use(express.json());

let vegetables = [
  { id: '1', name: 'Bayam', price: 5000, imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQgllXhmd_xqaUmqEfaJZo9k0Ydjt4kdP6aOxwLpWjOe3uJEMgrR7tVmyXyPmeX-3qQdhs&usqp=CAU', rating: 4.5 },
  { id: '3', name: 'Kangkung', price: 4000, imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcREsLeY-c-9Om3uSghToTFLQ7ktJlMb3JXpXg&usqp=CAU', rating: 4.0 },
  { id: '4', name: 'Bawang Putih', price: 4000, imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcREsLeY-c-9Om3uSghToTFLQ7ktJlMb3JXpXg&usqp=CAU', rating: 4.0 },
  { id: '5', name: 'Bawang Merah', price: 2000, imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcREsLeY-c-9Om3uSghToTFLQ7ktJlMb3JXpXg&usqp=CAU', rating: 4.0 },
  { id: '6', name: 'Tomat', price: 4000, imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcREsLeY-c-9Om3uSghToTFLQ7ktJlMb3JXpXg&usqp=CAU', rating: 4.0 },
  { id: '7', name: 'Cabai', price: 3000, imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcREsLeY-c-9Om3uSghToTFLQ7ktJlMb3JXpXg&usqp=CAU', rating: 4.0 },
  { id: '8', name: 'Seledri', price: 4000, imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcREsLeY-c-9Om3uSghToTFLQ7ktJlMb3JXpXg&usqp=CAU', rating: 4.0 },
  { id: '9', name: 'Kentang', price: 5000, imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcREsLeY-c-9Om3uSghToTFLQ7ktJlMb3JXpXg&usqp=CAU', rating: 4.0 },
  { id: '10', name: 'Asam jawa', price: 4000, imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcREsLeY-c-9Om3uSghToTFLQ7ktJlMb3JXpXg&usqp=CAU', rating: 4.0 },
];

let mealPackages = [
  { id: '1', name: 'Sayur Sop', price: 21000, imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSJGdTPguR6AZ4yZfoL1yY7RXaKoOB1e18vcg&usqp=CAU', rating: 4.5 },
  { id: '2', name: 'Sayur Buncis', price: 25000, imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSGGbbl-cu3fNv9bAPQaAnToPjgK3eNvPEicg&usqp=CAU', rating: 4.2 },
  { id: '3', name: 'Sayur Asem', price: 25000, imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSJGdTPguR6AZ4yZfoL1yY7RXaKoOB1e18vcg&usqp=CAU', rating: 4.5 },
  { id: '4', name: 'Sayur Bening', price: 28000, imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSJGdTPguR6AZ4yZfoL1yY7RXaKoOB1e18vcg&usqp=CAU', rating: 4.5 },
  { id: '5', name: 'Sayur Tempe Lombok Ijo', price: 26000, imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSJGdTPguR6AZ4yZfoL1yY7RXaKoOB1e18vcg&usqp=CAU', rating: 4.5 },
  { id: '6', name: 'Tempe Orek', price: 24000, imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSJGdTPguR6AZ4yZfoL1yY7RXaKoOB1e18vcg&usqp=CAU', rating: 4.5 },
  { id: '7', name: 'Sayur Capcay', price: 23000, imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSJGdTPguR6AZ4yZfoL1yY7RXaKoOB1e18vcg&usqp=CAU', rating: 4.5 },
  { id: '8', name: 'Sayur Lodeh', price: 22000, imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSJGdTPguR6AZ4yZfoL1yY7RXaKoOB1e18vcg&usqp=CAU', rating: 4.5 },
  { id: '9', name: 'Bakwan Jagung', price: 20000, imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSJGdTPguR6AZ4yZfoL1yY7RXaKoOB1e18vcg&usqp=CAU', rating: 4.5 },
  { id: '10', name: 'Gulai Nangka Muda', price: 24000, imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSJGdTPguR6AZ4yZfoL1yY7RXaKoOB1e18vcg&usqp=CAU', rating: 4.5 },
];

app.get('/vegetables', (req, res) => {
  res.json(vegetables);
});

app.get('/meal-packages', (req, res) => {
  res.json(mealPackages);
});

app.listen(port, () => {
  console.log(`Server is running on http://localhost:3000}`);
});
