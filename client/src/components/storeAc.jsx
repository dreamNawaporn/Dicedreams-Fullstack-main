import React, { useState } from "react";
import {
  Box,
  Typography,
  Avatar,
  IconButton,
  Menu,
  MenuItem,
} from "@mui/material";
import { MoreVert as MoreVertIcon } from "@mui/icons-material";

const formatDateToThai = (isoDateString) => {
  const thaiDays = [
    "วันอาทิตย์",
    "วันจันทร์",
    "วันอังคาร",
    "วันพุธ",
    "วันพฤหัสบดี",
    "วันศุกร์",
    "วันเสาร์",
  ];

  const thaiMonths = [
    "มกราคม",
    "กุมภาพันธ์",
    "มีนาคม",
    "เมษายน",
    "พฤษภาคม",
    "มิถุนายน",
    "กรกฎาคม",
    "สิงหาคม",
    "กันยายน",
    "ตุลาคม",
    "พฤศจิกายน",
    "ธันวาคม",
  ];

  const date = new Date(isoDateString);

  const day = date.getDate();
  const month = date.getMonth();
  const year = date.getFullYear() + 543;
  const weekday = thaiDays[date.getDay()];

  const hours = date.getHours();
  const minutes = date.getMinutes();
  const formattedTime = `${hours}:${minutes} น.`;

  return `${day} ${thaiMonths[month]} พ.ศ. ${year} เวลา ${formattedTime}`;
};

const StoreAc = ({ data, storeImg, storeName }) => {
  const [anchorEl, setAnchorEl] = useState(null);
  const menuOpen = Boolean(anchorEl);

  const handleMenuClick = (event) => {
    setAnchorEl(event.currentTarget);
  };

  const handleMenuClose = () => {
    setAnchorEl(null);
  };


  if (!data || data.length === 0) {
    return <Typography>No activities available.</Typography>;
  }

  return data.map((activity, index) => {
    return (
      <Box
        key={index}
        sx={{
          backgroundColor: "#400467",
          borderRadius: "1rem",
          paddingTop: 1,
          width: "80%",
          margin: "auto",
          marginBottom: 4,
        }}
      >
        <Box
          sx={{
            backgroundColor: "#400467",
            height: "8vh",
            width: "100%",
            borderRadius: 2,
            display: "flex",
            justifyContent: "space-between",
            alignItems: "center",
            color: "white",
            p: 2,
          }}
        >
          <Box sx={{ display: "flex", alignItems: "center" }}>
            <Avatar
              sx={{ bgcolor: "red", marginRight: 2 }}
              aria-label="profile-picture"
              src={storeImg}
              alt={"No Image"}
            />
            <Box>
              <Typography variant="h6">{storeName}</Typography>
              <Typography variant="h10">
                {formatDateToThai(activity.creation_date)}
              </Typography>
            </Box>
          </Box>

          <Box sx={{ marginLeft: "auto" }}>
            <IconButton
              aria-label="more"
              id="long-button"
              aria-controls={menuOpen ? "long-menu" : undefined}
              aria-expanded={menuOpen ? "true" : undefined}
              aria-haspopup="true"
              onClick={handleMenuClick}
              sx={{ color: "white" }}
            >
              <MoreVertIcon />
            </IconButton>
            <Menu
              id="long-menu"
              MenuListProps={{
                "aria-labelledby": "long-button",
              }}
              anchorEl={anchorEl}
              open={menuOpen}
              onClose={handleMenuClose}
              PaperProps={{
                style: {
                  maxHeight: 48 * 4.5,
                  width: "20ch",
                },
              }}
            >
              {["Option 1", "Option 2", "Option 3"].map((option) => (
                <MenuItem key={option} onClick={handleMenuClose}>
                  {option}
                </MenuItem>
              ))}
            </Menu>
          </Box>
        </Box>

        <Box
          sx={{
            marginLeft: 2,
            marginRight: 2,
            marginBottom: 2,
          }}
        >
          <img
            src={activity.post_activity_image || "No img"}
            alt={activity.post_activity_image || "No img"}
            style={{ width: "100%", borderRadius: 4 }}
          />
        </Box>

        <Box
          sx={{
            margin: 4,
            paddingBottom: 3,
          }}
        >
          <Typography variant="h5">
            {activity.name_activity || "no text"}
          </Typography>
          <Typography variant="body1">
            วันที่กิจกรรมเริ่ม: {activity.date_activity}
          </Typography>
          <Typography variant="body1">
            เวลาที่กิจกรรมเริ่ม: {activity.time_activity}
          </Typography>
          <Typography variant="body1">
            สถานที่: {activity.location || "????"}
          </Typography>
          <Typography variant="body1">
            {activity.detail_post || "????"}
          </Typography>
        </Box>
      </Box>
    );
  });
};

export default StoreAc;
