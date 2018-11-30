#include <stdio.h>
#include <string.h>
#include <omnetpp.h>
#include <math.h>

using namespace omnetpp;

class Source : public cSimpleModule
{
public:
    Source();
    virtual ~Source();

protected:
    virtual void initialize() override;
};

void Source::initialize()
{
    cPacket *pkt = new cPacket("packet");
        pkt ->getKind(range(0,1));
}
