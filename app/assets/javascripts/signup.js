Position = {
        setup: function() {
            var dropdown = document.getElementById('role_position');
            if (dropdown != null && dropdown.options[dropdown.selectedIndex].value == 'User') {
                document.getElementById('position_code').style.display = "none";
            }
        }
    }
    $(Position.setup); 

function positionChange(obj)
{
  if(obj.value == 'Staff' || obj.value == 'Admin')
  {
    document.getElementById('position_code').style.display = 'block';
    document.getElementById('position_code').style.display = 'inline';
  }
  else
  {
    document.getElementById('position_code').style.display = 'none';
  }
}