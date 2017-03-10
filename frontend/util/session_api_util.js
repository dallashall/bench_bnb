export const postNewUser = (user) => {
  return $.ajax({
    method: "POST",
    url: "/api/users",
    data: {user}
  });
};

export const postLoginUser = (user) => {
  return $.ajax({
    method: "POST",
    url: "/api/session",
    data: {user}
  });
};

export const deleteLogoutUser = () => {
  return $.ajax({
    method: "DELETE",
    url: "/api/session"
  });
};