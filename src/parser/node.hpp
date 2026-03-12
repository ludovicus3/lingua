#ifndef __LINGUA__PARSER__NODE_HPP__
#define __LINGUA__PARSER__NODE_HPP__

namespace lingua {

namespace parser {

class node {
public:
  virtual ~node() = default;

  virtual Value* code() = 0;
};

} // end namespace parser

} // end namespace lingua

#endif // __LINGUA__PARSER__NODE_HPP__
