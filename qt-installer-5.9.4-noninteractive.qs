// https://stackoverflow.com/a/34032216/78204

function Controller() {
    installer.autoRejectMessageBoxes();
    installer.installationFinished.connect(function() {
        gui.clickButton(buttons.NextButton);
    })
}

Controller.prototype.WelcomePageCallback = function() {
    gui.clickButton(buttons.NextButton, 3000);
}

Controller.prototype.CredentialsPageCallback = function() {
    gui.clickButton(buttons.NextButton);
}

Controller.prototype.IntroductionPageCallback = function() {
    gui.clickButton(buttons.NextButton);
}

Controller.prototype.TargetDirectoryPageCallback = function()
{
    gui.currentPageWidget().TargetDirectoryLineEdit.setText(installer.value("HomeDir") + "/Qt-5.9.4");
    gui.clickButton(buttons.NextButton);
}

Controller.prototype.ComponentSelectionPageCallback = function() {
    var widget = gui.currentPageWidget();

    // widget.selectAll();
    widget.deselectAll();

    widget.selectComponent("qt.594.clang_64")
    // widget.selectComponent("qt.594.doc")
    // widget.selectComponent("qt.594.examples")
    widget.selectComponent("qt.594.qtcharts")
    widget.selectComponent("qt.594.qtcharts.clang_64")
    widget.selectComponent("qt.594.qtdatavis3d")
    widget.selectComponent("qt.594.qtdatavis3d.clang_64")
    widget.selectComponent("qt.594.qtnetworkauth")
    widget.selectComponent("qt.594.qtnetworkauth.clang_64")
    widget.selectComponent("qt.594.qtpurchasing")
    widget.selectComponent("qt.594.qtpurchasing.clang_64")
    widget.selectComponent("qt.594.qtremoteobjects")
    widget.selectComponent("qt.594.qtremoteobjects.clang_64")
    widget.selectComponent("qt.594.qtscript")
    widget.selectComponent("qt.594.qtspeech")
    widget.selectComponent("qt.594.qtspeech.clang_64")
    widget.selectComponent("qt.594.qtvirtualkeyboard")
    widget.selectComponent("qt.594.qtvirtualkeyboard.clang_64")
    widget.selectComponent("qt.594.qtwebengine")
    widget.selectComponent("qt.594.qtwebengine.clang_64")
    // widget.selectComponent("qt.594.src")
    widget.selectComponent("qt.tools.qtcreator")

    gui.clickButton(buttons.NextButton);
}

Controller.prototype.LicenseAgreementPageCallback = function() {
    gui.currentPageWidget().AcceptLicenseRadioButton.setChecked(true);
    gui.clickButton(buttons.NextButton);
}

Controller.prototype.StartMenuDirectoryPageCallback = function() {
    gui.clickButton(buttons.NextButton);
}

Controller.prototype.ReadyForInstallationPageCallback = function()
{
    gui.clickButton(buttons.NextButton);
}

Controller.prototype.FinishedPageCallback = function() {
var checkBoxForm = gui.currentPageWidget().LaunchQtCreatorCheckBoxForm
if (checkBoxForm && checkBoxForm.launchQtCreatorCheckBox) {
    checkBoxForm.launchQtCreatorCheckBox.checked = false;
}
    gui.clickButton(buttons.FinishButton);
}
