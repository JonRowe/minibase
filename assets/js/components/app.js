import { gql } from 'apollo-boost';
import React from 'react'
import { compose, graphql } from 'react-apollo';
import ReactTable from 'react-table'

const GetMiniData = gql`
  query {
    minis {
      id
      year
      number
      name
      design { name }
      lastMinitransatResult {
        position
        date
      }
    }
  }
`

class DataSheetWrangler extends React.Component {
  resultString(result) {
    if(result)
    {
      var name = '#' + result.position;
      name = name + ', ' + result.date.replace(/-.*/,'')
      return name;
    }
  }

  render () {
    if (this.props.data.loading) return <div>Loading...</div>
    if (this.props.data.error) return <div>Error!</div>

    return (
      <ReactTable
        columns={[
          { Header: "Number", accessor: "number" },
          { Header: "ID", accessor: "id" },
          { Header: "Year", accessor: "year" },
          { Header: "Design", accessor: (m => m.design && m.design.name), id: "design" },
          { Header: "Last Transat", accessor: (m => this.resultString(m.lastMinitransatResult)), id: "last_transat" }
        ]}
        data={this.props.data.minis}
        filterable={true}
      />
    )
  }
}

const App = compose(graphql(GetMiniData),)(DataSheetWrangler)

export default App
