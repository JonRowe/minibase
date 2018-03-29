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
      bestResults {
        race { name }
        position
        date
      }
    }
  }
`

class DataSheetWrangler extends React.Component {
  resultString(result, displayName) {
    if(result)
    {
      var name = '#' + result.position;
      if(displayName)
      {
        name = name + ' ' + result.race.name
      }
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
          { Header: "Number", accessor: "number", maxWidth: 75 },
          { Header: "ID", accessor: "id", maxWidth: 75 },
          { Header: "Year", accessor: "year", maxWidth: 75 },
          { Header: "Design", accessor: (m => m.design && m.design.name), id: "design", maxWidth: 400 },
          { Header: "Last Transat", accessor: (m => this.resultString(m.lastMinitransatResult, false)), id: "last_transat", maxWidth: 100 },
          { Header: "Best Results", accessor: (m => m.bestResults.map(r => this.resultString(r, true)).join('; ')), id: "best_results" }
        ]}
        data={this.props.data.minis}
        filterable={true}
      />
    )
  }
}

const App = compose(graphql(GetMiniData),)(DataSheetWrangler)

export default App
