import { lazy } from "react";

const AdminDashBoard = lazy(() =>
  import("../components/dashboards/default/index")
);

const Appointment = lazy(() =>
  import("../components/appointments/Appointment")
);
const AppointmentEditForm = lazy(() =>
  import("../components/appointments/AppointmentEditForm")
);

const EmergencyContactsForm = lazy(() =>
  import("../components/emergencycontacts/EmergencyContactForm")
);

const Orders = lazy(() => import("../components/orders/Orders"));
const OrdersInfo = lazy(() => import("../components/orders/OrdersInfo"));

const Profile = lazy(() => import("../components/dashboards/default/Profile"));
const PageNotFound = lazy(() => import("../components/errors/Error404"));

const ProductsForm = lazy(() => import("../components/products/ProductsForm"));
const PodcastForm = lazy(() => import("../components/podcasts/PodcastForm"));
const BlogForm = lazy(() => import("../components/blogs/BlogAdminForm"));
const ListOfUsers = lazy(() => import("../components/useradmin/UserList"));
const PageVisits = lazy(() => import("../components/gadashboard/PageVisits"));
const Chat = lazy(() => import("../components/messages/Chat"));
const SiteReferenceChart = lazy(() =>
  import("../components/sitereference/SiteReferenceChart")
);

const sitereference = [
  {
    path: "/sitereferencechart",
    name: "SiteReferenceChart",
    exact: true,
    element: SiteReferenceChart,
    roles: ["Admin"],
    isAnonymous: true,
  },
];

const appointmentRoutes = [
  {
    path: "/appointments",
    name: "Appointments",
    header: "Navigation",
    exact: true,
    element: Appointment,
    roles: ["User", "Admin"],
    isAnonymous: false,
  },
  {
    path: "/appointments/edit",
    name: "AppointmentEditForm",
    header: "Navigation",
    exact: true,
    element: AppointmentEditForm,
    roles: ["User", "Admin"],
    isAnonymous: false,
  },
];
const dashboardRoutes = [
  {
    path: "/dashboard",
    name: "Dashboards",
    header: "Navigation",
    children: [
      {
        path: "/dashboard/analytics",
        name: "Analytics",
        element: AdminDashBoard,
        roles: ["Admin"],
        exact: true,
        isAnonymous: false,
      },
      {
        path: "/dashboard/profile",
        name: "Profile",
        element: Profile,
        roles: ["Admin", "User"],
        exact: true,
        isAnonymous: false,
      },
      {
        path: "/sitetraffic",
        name: "A Secured Admin Route",
        exact: true,
        element: PageVisits,
        roles: ["Admin"],
        isAnonymous: false,
      },
    ],
  },
];

const emergencyContactRoutes = [
  {
    path: "/emergency/contact/form",
    name: "EmergencyContacts",
    exact: true,
    element: EmergencyContactsForm,
    roles: ["Admin", "User"],
    isAnonymous: false,
  },
];

const orders = [
  {
    path: "/orders",
    name: "Orders",
    exact: true,
    element: Orders,
    roles: ["Admin"],
    isAnonymous: false,
  },
  {
    path: "/orders/:id",
    name: "Orders/id",
    exact: true,
    element: OrdersInfo,
    roles: ["Admin", "User"],
    isAnonymous: false,
  },
];

const messages = [
  {
    path: "/messages",
    name: "Chat",
    exact: true,
    element: Chat,
    roles: ["Admin", "User"],
    isAnonymous: false,
  },
];

const products = [
  {
    path: "/products/new",
    name: "New Product",
    exact: true,
    element: ProductsForm,
    roles: ["Admin"],
    isAnonymous: false,
  },
];

const errorRoutes = [
  {
    path: "/error-404",
    name: "Error - 404",
    element: PageNotFound,
    roles: [],
    exact: true,
    isAnonymous: false,
  },
];

const podcasts = [
  {
    path: "/podcasts/new",
    name: "PodcastForm",
    exact: true,
    element: PodcastForm,
    roles: ["Admin"],
    isAnonymous: false,
  },
  {
    path: "/podcasts/:id",
    name: "PodcastForm",
    exact: true,
    element: PodcastForm,
    roles: ["Admin"],
    isAnonymous: true,
  },
];

const blogAdminRoute = [
  {
    path: "/blogs/admin",
    name: "adminForm",
    exact: true,
    element: BlogForm,
    roles: ["Admin"],
  },
];

const userList = [
  {
    path: "/userlist",
    name: "Users List",
    element: ListOfUsers,
    roles: ["Admin"],
    exact: true,
    isAnonymous: false,
  },
];

const allRoutes = [
  ...sitereference,
  ...appointmentRoutes,
  ...dashboardRoutes,
  ...errorRoutes,
  ...emergencyContactRoutes,
  ...orders,
  ...blogAdminRoute,
  ...products,
  ...podcasts,
  ...messages,
  ...userList,
];

export default allRoutes;
