class WarningMessage {
  String? warningMessage;
  String? warningMessageBody;

  WarningMessage(this.warningMessage, this.warningMessageBody);
  static List warningmessagelist = [
    WarningMessage("Warning ⚠",
        '''soil temperature degree rate raised more than normal'''),
    WarningMessage("Warning ⚠",
        '''soil moisture degree rate less than normal'''),
    WarningMessage("Warning ⚠",
        '''soil temperature degree rate less than normal'''),
  ];
}
