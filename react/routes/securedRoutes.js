import { lazy } from "react";

const BlogForm = lazy(() => import("../components/blogs/BlogAdminForm"));

const blogAdminRoute = [
  {
    path: "/blogs/admin",
    name: "adminForm",
    exact: true,
    element: BlogForm,
    roles: ["Admin"],
  },
];

const allRoutes = [
  ...blogAdminRoute,
];

export default allRoutes;
