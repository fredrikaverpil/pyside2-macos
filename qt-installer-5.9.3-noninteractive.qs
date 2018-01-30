// https://stackoverflow.com/a/34032216/78204

function Controller() {
    installer.autoRejectMessageBoxes();
    installer.installationFinished.connect(function() {
        gui.clickButton(buttons.NextButton);
    })
}

Controller.prototype.WelcomePageCallback = function() {
    gui.clickButton(buttons.NextButton);
}

Controller.prototype.CredentialsPageCallback = function() {
    gui.clickButton(buttons.NextButton);
}

Controller.prototype.IntroductionPageCallback = function() {
    gui.clickButton(buttons.NextButton);
}

Controller.prototype.TargetDirectoryPageCallback = function()
{
    gui.currentPageWidget().TargetDirectoryLineEdit.setText(installer.value("HomeDir") + "/Qt-5.9.3");
    gui.clickButton(buttons.NextButton);
}

Controller.prototype.ComponentSelectionPageCallback = function() {
    var widget = gui.currentPageWidget();

    // widget.selectAll();
    widget.deselectAll();

    widget.selectComponent("qt.593.clang_64")
    // widget.selectComponent("qt.593.doc")
    // widget.selectComponent("qt.593.examples")
    widget.selectComponent("qt.593.qtcharts")
    widget.selectComponent("qt.593.qtcharts.clang_64")
    widget.selectComponent("qt.593.qtdatavis3d")
    widget.selectComponent("qt.593.qtdatavis3d.clang_64")
    widget.selectComponent("qt.593.qtnetworkauth.clang_64")
    widget.selectComponent("qt.593.qtpurchasing.clang_64")
    widget.selectComponent("qt.593.qtremoteobjects.clang_64")
    widget.selectComponent("qt.593.qtscript")
    widget.selectComponent("qt.593.qtspeech")
    widget.selectComponent("qt.593.qtspeech.clang_64")
    widget.selectComponent("qt.593.qtvirtualkeyboard.clang_64")
    widget.selectComponent("qt.593.qtwebengine")
    widget.selectComponent("qt.593.qtwebengine.clang_64")
    // widget.selectComponent("qt.593.src")
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
