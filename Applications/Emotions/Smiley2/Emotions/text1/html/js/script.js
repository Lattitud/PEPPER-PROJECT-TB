// keeping a pointer to the session is very useful!
var session;

try {
  QiSession( function (s) {
    console.log('connected!');
    session = s;
    // now that we are connected, we can use the buttons on the page
    $('button').prop('disabled', false);
    s.service('ALMemory').then(function (memory) {
      memory.subscriber('TouchChanged').then(function (subscriber) {
        subscriber.signal.connect(changeTitle);
      });
    });
  });
} catch (err) {
  console.log("Error when initializing QiSession: " + err.message);
  console.log("Make sure you load this page from the robots server.")
}

$(function () {
  $('#start').click(gameStart);
  
});

function changeTitle() {
  $('button').text('Game start!')
}

function gameStart() {
  session.service('ALMemory').then(function (memory) {
	session.service('ALTextToSpeech').then(function (tts) {
    tts.say("Thank you!we can start the game");
  }, function (error) {
    console.log(error);
  })

    memory.insertData('Start_Smiley',1);
  }, function (error) {
    console.log(error);
  })
  throw new Error('This is not an error. This is just to abort javascript');
}

