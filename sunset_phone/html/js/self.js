copyMyPhoneNumber = () =>{
  var copyText = document.getElementById("myPhoneNumber");

  let elem = document.createElement("textarea");
  let success = false;

  elem.value = copyText.innerHTML;
  document.body.appendChild(elem);

  elem.focus();
  elem.select();

  try { success = !!document.execCommand("copy"); }
  catch (err) {}

  document.body.removeChild(elem);

  QB.Phone.Notifications.Add("fa fa-files-o", "Copy Phone Number", "Success", "#93BFCF", 5000);
}