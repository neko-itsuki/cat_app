/* global $*/
$(function() {
  return $('#user_postcode').jpostal({
    postcode: ['#user_postcode'],
    address: {
      '#user_prefecture_code': '%3',
      '#user_address_city': '%4',
      '#user_address_street': '%5%6%7',
    },
  });
});

$(function() {
  return $('#foster_parent_recruiter_postcode').jpostal({
    postcode: ['#foster_parent_recruiter_postcode'],
    address: {
      '#foster_parent_recruiter_prefecture_code': '%3',
      '#foster_parent_recruiter_address_city': '%4',
      '#foster_parent_recruiter_address_street': '%5%6%7',
    },
  });
});

$(function() {
  return $('#center_postcode').jpostal({
    postcode: ['#center_postcode'],
    address: {
      '#center_prefecture_code': '%3',
      '#center_address_city': '%4',
      '#center_address_street': '%5%6%7',
    },
  });
});
