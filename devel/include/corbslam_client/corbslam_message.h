// Generated by gencpp from file corbslam_client/corbslam_message.msg
// DO NOT EDIT!


#ifndef CORBSLAM_CLIENT_MESSAGE_CORBSLAM_MESSAGE_H
#define CORBSLAM_CLIENT_MESSAGE_CORBSLAM_MESSAGE_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace corbslam_client
{
template <class ContainerAllocator>
struct corbslam_message_
{
  typedef corbslam_message_<ContainerAllocator> Type;

  corbslam_message_()
    : TRANSM()
    , DATA()  {
    }
  corbslam_message_(const ContainerAllocator& _alloc)
    : TRANSM(_alloc)
    , DATA(_alloc)  {
  (void)_alloc;
    }



   typedef std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other >  _TRANSM_type;
  _TRANSM_type TRANSM;

   typedef std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other >  _DATA_type;
  _DATA_type DATA;





  typedef boost::shared_ptr< ::corbslam_client::corbslam_message_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::corbslam_client::corbslam_message_<ContainerAllocator> const> ConstPtr;

}; // struct corbslam_message_

typedef ::corbslam_client::corbslam_message_<std::allocator<void> > corbslam_message;

typedef boost::shared_ptr< ::corbslam_client::corbslam_message > corbslam_messagePtr;
typedef boost::shared_ptr< ::corbslam_client::corbslam_message const> corbslam_messageConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::corbslam_client::corbslam_message_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::corbslam_client::corbslam_message_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace corbslam_client

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': False, 'IsMessage': True, 'HasHeader': False}
// {'corbslam_client': ['/home/xiangyu/Library/CORB-SLAM/src/corbslam_client/msg'], 'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::corbslam_client::corbslam_message_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::corbslam_client::corbslam_message_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::corbslam_client::corbslam_message_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::corbslam_client::corbslam_message_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::corbslam_client::corbslam_message_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::corbslam_client::corbslam_message_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::corbslam_client::corbslam_message_<ContainerAllocator> >
{
  static const char* value()
  {
    return "5356b099d5ff117b1b1e0b26458d0016";
  }

  static const char* value(const ::corbslam_client::corbslam_message_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x5356b099d5ff117bULL;
  static const uint64_t static_value2 = 0x1b1e0b26458d0016ULL;
};

template<class ContainerAllocator>
struct DataType< ::corbslam_client::corbslam_message_<ContainerAllocator> >
{
  static const char* value()
  {
    return "corbslam_client/corbslam_message";
  }

  static const char* value(const ::corbslam_client::corbslam_message_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::corbslam_client::corbslam_message_<ContainerAllocator> >
{
  static const char* value()
  {
    return "string TRANSM\n\
string DATA\n\
";
  }

  static const char* value(const ::corbslam_client::corbslam_message_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::corbslam_client::corbslam_message_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.TRANSM);
      stream.next(m.DATA);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct corbslam_message_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::corbslam_client::corbslam_message_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::corbslam_client::corbslam_message_<ContainerAllocator>& v)
  {
    s << indent << "TRANSM: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > >::stream(s, indent + "  ", v.TRANSM);
    s << indent << "DATA: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > >::stream(s, indent + "  ", v.DATA);
  }
};

} // namespace message_operations
} // namespace ros

#endif // CORBSLAM_CLIENT_MESSAGE_CORBSLAM_MESSAGE_H
