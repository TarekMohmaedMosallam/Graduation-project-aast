class HelpCenter {
  String? problemname;
  String? solution;

  HelpCenter(this.problemname, this.solution);
  static List<HelpCenter> helpcenterlist = [
    HelpCenter('How can I scan my crops?', '''
By Scanning your crop  user our powerful
AI model , you can see if there is any diseased crops.
1- Click on the Camera icon in the bottom center of the app 
2- Take a photo of the intended crop to see if its affected or not 
Remember, our app only works on rice crops, and can only scan one crop at a time  '''),
    HelpCenter('How do I know \nthe details about rice diseases?', '''at home page you will find the scanned disease button 

1- You will click on button

2- then you will find three diseases related to rice crop 

3- you can select the one you want to know the details about 

4- it will turn you into the pictures for chosen disease with more details '''),
    HelpCenter('Can i have real time\n monitoring data?', ''' at home page you will find the smart irrigation button

1- you will press on button

2- then you will find temperature, 
Humidity and soil moisture rate
 '''),
  ];
}
