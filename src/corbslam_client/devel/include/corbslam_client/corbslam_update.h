// Generated by gencpp from file corbslam_client/corbslam_update.msg
// DO NOT EDIT!


#ifndef CORBSLAM_CLIENT_MESSAGE_CORBSLAM_UPDATE_H
#define CORBSLAM_CLIENT_MESSAGE_CORBSLAM_UPDATE_H

#include <ros/service_traits.h>


#include <corbslam_client/corbslam_updateRequest.h>
#include <corbslam_client/corbslam_updateResponse.h>


namespace corbslam_client
{

struct corbslam_update
{

typedef corbslam_updateRequest Request;
typedef corbslam_updateResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct corbslam_update
} // namespace corbslam_client


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::corbslam_client::corbslam_update > {
  static const char* value()
  {
    return "1aabe292bb21d2f96bb243920fb547e5";
  }

  static const char* value(const ::corbslam_client::corbslam_update&) { return value(); }
};

template<>
struct DataType< ::corbslam_client::corbslam_update > {
  static const char* value()
  {
    return "corbslam_client/corbslam_update";
  }

  static const char* value(const ::corbslam_client::corbslam_update&) { return value(); }
};


// service_traits::MD5Sum< ::corbslam_client::corbslam_updateRequest> should match 
// service_traits::MD5Sum< ::corbslam_client::corbslam_update > 
template<>
struct MD5Sum< ::corbslam_client::corbslam_updateRequest>
{
  static const char* value()
  {
    return MD5Sum< ::corbslam_client::corbslam_update >::value();
  }
  static const char* value(const ::corbslam_client::corbslam_updateRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::corbslam_client::corbslam_updateRequest> should match 
// service_traits::DataType< ::corbslam_client::corbslam_update > 
template<>
struct DataType< ::corbslam_client::corbslam_updateRequest>
{
  static const char* value()
  {
    return DataType< ::corbslam_client::corbslam_update >::value();
  }
  static const char* value(const ::corbslam_client::corbslam_updateRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::corbslam_client::corbslam_updateResponse> should match 
// service_traits::MD5Sum< ::corbslam_client::corbslam_update > 
template<>
struct MD5Sum< ::corbslam_client::corbslam_updateResponse>
{
  static const char* value()
  {
    return MD5Sum< ::corbslam_client::corbslam_update >::value();
  }
  static const char* value(const ::corbslam_client::corbslam_updateResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::corbslam_client::corbslam_updateResponse> should match 
// service_traits::DataType< ::corbslam_client::corbslam_update > 
template<>
struct DataType< ::corbslam_client::corbslam_updateResponse>
{
  static const char* value()
  {
    return DataType< ::corbslam_client::corbslam_update >::value();
  }
  static const char* value(const ::corbslam_client::corbslam_updateResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // CORBSLAM_CLIENT_MESSAGE_CORBSLAM_UPDATE_H
