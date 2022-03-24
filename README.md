# MVVM-Demo
This flutter demo for MVVM Design pattern with provider 
<h1>About MVVM Architecture</h1>
<p>
MVVM is one of the architectural patterns which enhances separation of concerns, it allows separating the user interface logic from the business (or the back-end) logic. Its target (with other MVC patterns goal) is to achieve the following principle “Keeping UI code simple and free of app logic in order to make it easier to manage”.
    
MVVM is an abbreviation of Model View Veiw model where your presentaion layer will be divided into three packages -
    
<Br/> <b>Model</b> : Model represents the data and business logic of the app.
    
<Br/> <b>View</b> : The view role in this pattern is to observe (or subscribe to) a ViewModel observable to get data in order to update UI elements accordingly.
    
<Br/> <b>View Model</b> : ViewModel interacts with model and also prepares observable(s) that can be observed by a View.

<div id="container">
    <img src="https://miro.medium.com/max/1212/1*BpxMFh7DdX0_hqX6ABkDgw.png" alt="" />
</div>
<p>This repo contains the following branches
  <ul>
    <li><b>master</b>: contains MVVM architecture with provider, network connection check, API manager, Drawer and app version check </li>
  </ul>
</p>

</p>
<h2> Used Libraries</h2>
<ul>
<li>dio</li>
<li>connectivity_plus</li>
<li>provider</li>
</ul>


<p>
<div align="center">
        <img width="45%" src="https://github.com/amit-rawal/flutter_mvvm_provider/blob/main/screenshots/home_page.png" alt="Home Page" title="Home Page"</img>
        <img height="0" width="8px">
        <img width="45%" src="https://github.com/amit-rawal/flutter_mvvm_provider/blob/main/screenshots/drawer.png" alt="Drawer" title="Side Menu / Drawer"></img>
</div>
</p>

MIT License

Copyright (c) 2022 Amit Rawal

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
